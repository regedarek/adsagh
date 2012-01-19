class Ad < ActiveRecord::Base
  belongs_to :advertiser
  belongs_to :admin

  scope :confirmed_ads,  :conditions => ["advertiser_id IS NOT NULL"]
  scope :unconfirmed_ads,  :conditions => ["advertiser_id IS NULL"]
  scope :unverified_ads,  :conditions => ["advertiser_id IS NOT NULL AND verification_date IS NULL"]
  scope :ads_by_user, lambda { |email| { :conditions => ["email = ?", email] } }

  attr_accessible :title, :name, :phone_number, :email, :advertiser_id, :ad_content, :token, :verification_date, :category_id, :price, :display_counter, :photos_attributes

  has_many :photos, :as => :attachable
  accepts_nested_attributes_for :photos

  validates_presence_of :title, :name, :email, :ad_content, :price, :category_id
  validates_length_of :name, :within => Settings.ad.min_name_size..Settings.ad.max_name_size
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_numericality_of :price, :greater_than => 0, :less_than => 1000000  # http://stackoverflow.com/questions/4467224/rails-why-format-regex-validation-fails

  before_create { generate_token(:token) }

  def send_edit_link
    AdMailer.send_edit_link(self).deliver
  end

  def send_discard_info(discard_info)
    AdMailer.why_discard(self, discard_info).deliver
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
      :awaiting_verification
    else
      AdMailer.ad_token(self).deliver
      :awaiting_email_confirmation
    end
  end

  def confirm_by(id, token)
    ad = Ad.find(id)
    self.advertiser = Advertiser.find_or_create_by_email(:email => ad.email, :name => ad.name, :phone_number => ad.phone_number)
    if ad.token == token
      ad.update_attribute :advertiser_id, self.advertiser.id
      ad.update_attribute :level, 1
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

  # SEO FRIENDLY :)
  def to_param
    "#{id}-#{title.parameterize}"
  end

end


