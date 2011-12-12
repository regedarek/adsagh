require 'spec_helper'

describe Ad do

   before(:each) do
     @attr = { :title => "Nerka",
               :name => "Czesio",
               :email => "t@t.pl",
               :ad_content => "Sprzedam nerke nie smigana.",
               :phone_number => "662284020",
               :price => "7,45"
     }
   end

   it "should create a new instane given a valid attribute" do
     Ad.create!(@attr)
   end

   it "should require a title" do
      no_email_ad = Ad.new(@attr.merge(:title => ""))
      no_email_ad.should_not be_valid
   end

   it "should not require a name" do
     no_name_ad = Ad.new(@attr.merge(:name => ""))
     no_name_ad.should be_valid 
   end

   it "should require a email" do
      no_email_ad = Ad.new(@attr.merge(:email => ""))
      no_email_ad.should_not be_valid
   end

   it "should require a ad_content" do
      no_content_ad = Ad.new(@attr.merge(:ad_content => ""))
      no_content_ad.should_not be_valid    
   end

   it "should reject names that are too long" do
      long_name = "a" * 51
      long_name_ad = Ad.new(@attr.merge(:name => long_name))
      long_name_ad.should_not be_valid
   end

   it "should accept valid email" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp] 
    addresses.each do |address|
      valid_email_ad = Ad.new(@attr.merge(:email => address))
      valid_email_ad.should be_valid
    end
   end

   it "should reject invalid email" do
    addresses = %w[user@foo,com The_USER_at_fd.org example.g@ffd.] 
    addresses.each do |address|
      invalid_email_ad = Ad.new(@attr.merge(:email => address))
      invalid_email_ad.should_not be_valid
   end

   end

   # it "should reject duplicate email addresses" do
   #   Ad.create!(@attr)
   #   ad_with_duplicate_email = Ad.new(@attr)
   #   ad_with_duplicate_email.should_not be_valid
   # end

 #   it "should reject email identical up to case" do
 #     upcased_email = @attr[:email].upcase
 #     Ad.create!(@attr.merge(:email => upcased_email))
 #     ad_with_duplicate_email = Ad.new(@attr)
 #   ad_with_duplicate_email.should_not be_valid
 # end

   it "should reject wrong phone_number" do
     phone = %w[kfksdfkds 543 0664435293 0126489384]
      phone.each do |n|
        invalid_phone_n = Ad.new(@attr.merge(:phone_number => n))
        invalid_phone_n.should_not be_valid
      end
   end

  it "should be display_counter null" do
      Ad.create!(@attr) 
      display_counter = @attr[:display_counter]
      display_counter.should be_nil
  end

  it "should convert currency with comma" do
    comma_price = "9,23"
    coma_price_ad = Ad.new(@attr.merge(:price => comma_price))
    coma_price_ad.save!
    coma_price_ad.price.should eql(9.23)
  end

  # it "price should not be empty" do
  #     no_price_ad = Ad.new(@attr.merge(:price => ""))
  #     no_price_ad.should_not be_valid
  # end
   # W sumie to jest sprawdzane w request_spec
   # it "should require a token" do
   #    no_token_ad = Ad.new(@attr.merge(:token => ""))
   #    no_token_ad.should_not be_valid
   # end
end

