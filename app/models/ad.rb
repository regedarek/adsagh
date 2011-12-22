class Ad < ActiveRecord::Base
  belongs_to :advertiser
  belongs_to :admin

  attr_accessible :title, :name, :phone_number, :email, :advertiser_id, :ad_content, :token, :verification_date, :category_id, :price, :display_counter

  validates_presence_of :title, :name, :email, :ad_content, :price, :category_id
  validates_length_of :name, :within => 3..50
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

end


