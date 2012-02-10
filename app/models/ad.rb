class Ad < ActiveRecord::Base
  belongs_to :advertiser
  belongs_to :admin
  has_many :photos

  scope :regular,  :conditions => ["type IS NULL"]
  scope :confirmed_ads,  :conditions => ["advertiser_id IS NOT NULL"]
  scope :unconfirmed_ads,  :conditions => ["advertiser_id IS NULL"]
  scope :unverified_ads,  :conditions => ["advertiser_id IS NOT NULL AND verification_date IS NULL"]
  scope :verified_ads,  :conditions => ["advertiser_id IS NOT NULL AND verification_date IS NOT NULL AND level >= ?", 2]
  scope :ads_by_user, lambda { |email| { :conditions => ["email = ?", email] } }

  attr_accessible :title, :name, :phone_number, :email, :advertiser_id, :ad_content, :token, :verification_date, :category_id, :price, :display_counter, :photos_attributes
  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates_presence_of :name, :email, :price, :category_id
  validates_presence_of :title, :ad_content, :if => :is_regular?
  validates_presence_of :from, :to, :unless => :is_regular?
  validates_length_of :name, :within => Settings.ad.min_name_size..Settings.ad.max_name_size
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_numericality_of :price, :greater_than => 0, :less_than => 1000000  # http://stackoverflow.com/questions/4467224/rails-why-format-regex-validation-fails

  before_create { generate_token(:token) }

  def is_regular?
    self.type.nil?
  end

  def send_edit_link
    AdMailer.send_edit_link(self).deliver
  end

  def send_discard_info(discard_info)
    AdMailer.why_discard(self, discard_info).deliver
  end

  def send_finish_info
    AdMailer.send_finish_info(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Ad.exists?(column => self[column])
  end

  def create_by(email)
    self.advertiser = Advertiser.find_by_email(email)
    return false unless save
    if self.advertiser
      if self.advertiser.ads.verified_ads.size >= Settings.auto_verification_times
        self.verify!(0)
        :succesfully_confirmed_and_verified_email
      else
      :awaiting_verification
      end
    else
      AdMailer.ad_token(self).deliver
      :awaiting_email_confirmation
    end
  end

  def update!(params_ad)
    self.update_attributes(params_ad)
    self.update_attribute :verification_date, nil
  end

  def confirm_by(id, token)
    ad = Ad.find(id)
    self.advertiser = Advertiser.find_or_create_by_email(:email => ad.email, :name => ad.name, :phone_number => ad.phone_number)
    if ad.token == token
      ad.update_attribute :advertiser_id, self.advertiser.id
      :succesfully_confirmed_email
    else
      :unsuccesfully_confirmed_email
    end
  end

  def self.with_some_scope(scope_name, email)
    case scope_name
      when 'unverified_ads'
        self.unverified_ads
      when 'unconfirmed_ads'
        self.unconfirmed_ads
      when 'confirmed_ads'
        self.confirmed_ads
      when 'ads_by_user'
        self.ads_by_user(email)
      else
        #domyslny scope
        self.unverified_ads
    end
  end

  def self.last_unverified
    self.unverified_ads.last
  end

  def self.unverified_empty?
    self.unverified_ads.empty?
  end

  def verify!(admin_id)
    self.update_attribute :verification_date, Time.now
    self.update_attribute :admin_id, admin_id
    self.update_attribute :level, 2
    self.send_edit_link
  end

  def discard!(discard_info)
    self.update_attribute :verification_date, Time.now
    self.update_attribute :level, 0
    self.send_discard_info(discard_info)
  end

  def finish
    self.update_attribute :level, 1
    self.send_finish_info
  end

  def self.remove_old_photos
    self.where(["updated_at < ?", 30.days.ago]).each { |ad| ad.photos.destroy_all }
  end

  # SEO FRIENDLY :)
  def to_param
    "#{id}-#{title.parameterize}"
  end
# rset alternate=spec/model/ad_spec.rb
end


