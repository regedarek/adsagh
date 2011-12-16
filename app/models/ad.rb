class Ad < ActiveRecord::Base
  belongs_to :advertiser

  attr_accessible :title, :name, :phone_number, :email, :email_id, :ad_content, :token, :verification_date, :category_id, :price, :display_counter

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  
  validates :title,        :presence   => true
  validates :name,         :length     => { :maximum => 50 },
                           :presence => true
  validates :email,        :presence   => true,
                           :format     => { :with => email_regex }
  validates :ad_content,   :presence   => true
  
  validates_numericality_of :price, :greater_than => 0, :less_than => 1000000  # http://stackoverflow.com/questions/4467224/rails-why-format-regex-validation-fails
  
  validates :price,         :presence =>true
  before_create { generate_token(:token) }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Ad.exists?(column => self[column])
  end
  
end
