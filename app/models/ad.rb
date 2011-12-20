class Ad < ActiveRecord::Base
  belongs_to :advertiser
  belongs_to :admin

  attr_accessible :title, :name, :phone_number, :email, :advertiser_id, :ad_content, :token, :verification_date, :category_id, :price, :display_counter

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  
  validates :title,        :presence   => true
  validates :name,         :length     => { :maximum => 50 },
                           :presence => true
  validates :email,        :presence   => true,
                           :format     => { :with => email_regex },
                           :uniqueness => { :case_sensitive => false }   
  validates :ad_content,   :presence   => true
  validates_numericality_of :price, :greater_than => 0, :less_than => 1000000  # http://stackoverflow.com/questions/4467224/rails-why-format-regex-validation-fails
  validates :price,         :presence =>true

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
  
end
