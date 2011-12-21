class Advertiser < ActiveRecord::Base
  has_many :ads

  validates :email, :uniqueness => { :case_sensitive => false }   
end
