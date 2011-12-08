class Ad < ActiveRecord::Base
  attr_accessible :title, :name, :phone_number, :email, :email_id, :ad_content, :token, :verification_date, :category_id, :price, :display_counter

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /^\(?\d{2}\)?-?\d{3}-?\d{4}$/i
  price_regex = /^\$?[0-9]+(,[0-9]{3})*(\.[0-9]{2})?$/i

  validates :title,        :presence   => true
  validates :name,         :length     => { :maximum => 50 }
  validates :email,        :presence   => true,
                           :format     => { :with => email_regex },
                           :uniqueness => { :case_sensitive => false } 
  validates :ad_content,   :presence   => true
  validates :phone_number, :format     => { :with => phone_regex, :allow_blank => true }
  validates :price,        :format     => { :with => price_regex }
  
  before_create { generate_token(:token) }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Ad.exists?(column => self[column])
  end
end
