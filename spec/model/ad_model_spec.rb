require 'spec_helper'

describe Ad do
  let(:ad) { Ad.sham! }
   before(:each) do
     @attr = { :title => "Nerka",
               :name => "Czesio",
               :email => "t@t.pl",
               :ad_content => "Sprzedam nerke nie smigana.",
               :phone_number => "662284020",
               :price => "5.55"
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
     no_name_ad.should_not be_valid 
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

   it "should reject duplicate email addresses" do
     Ad.create!(@attr)
     ad_with_duplicate_email = Ad.new(@attr)
     ad_with_duplicate_email.should_not be_valid
   end

   it "should reject email identical up to case" do
     upcased_email = @attr[:email].upcase
     Ad.create!(@attr.merge(:email => upcased_email))
     ad_with_duplicate_email = Ad.new(@attr)
     ad_with_duplicate_email.should_not be_valid
   end

    it "should be display_counter null" do
      Ad.create!(@attr) 
      display_counter = @attr[:display_counter]
      display_counter.should be_nil
    end

  it "should delivers email to advertiser" do
    ad.send_edit_link
    last_email.to.should include(ad.email)
  end

  it "generates a unique token each time" do
    ad1 = Ad.sham!
    ad2 = Ad.sham!
    ad2.token.should_not eq(ad1.token)
  end

  it "retrives the ad owner" do
    advertiser = Advertiser.sham!
    ad3 = Ad.sham!(:advertiser_id => advertiser.id)
    ad3.advertiser_id == ad3.advertiser.id
    
  end

end