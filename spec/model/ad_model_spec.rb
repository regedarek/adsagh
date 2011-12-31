require 'spec_helper'

describe Ad do
  let(:ad) { Ad.sham! }

  it "should create a new instane given a valid attribute" do
   ad.should be_valid
  end

  it "should require a title" do
    ad.title = nil
    ad.should_not be_valid
  end

  it "should require a category_id" do
    ad.category_id = nil
    ad.should_not be_valid
  end

  it "should require a ad_content" do
    ad.ad_content = nil
    ad.should_not be_valid
  end

  it "should require a name" do
    ad.name = nil
    ad.should_not be_valid
  end

  it "should require a price" do
    ad.price = nil
    ad.should_not be_valid
  end

  it "should reject names that are too long" do
    ad.name = "a" * 51
    ad.should_not be_valid
  end

  it "should accept valid email" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp] 
    addresses.each do |a|
      ad.email = a
      ad.should be_valid
    end
  end

  it "should reject invalid email" do
    addresses = %w[user@foo,com The_USER_at_fd.org example.g@ffd.] 
    addresses.each do |address|
      ad.email = addresses
      ad.should_not be_valid
    end
  end

   # it "should reject duplicate email addresses" do
   #   ad_with_duplicate_email = Ad.sham!(:email => ad.email)
   #   ad_with_duplicate_email.should_not be_valid
   # end

   # it "should reject email identical up to case" do
   #   upcased_email = ad.email.upcase
   #   ad_upcased_email = Ad.sham!(:email => upcased_email)
   #   ad_upcased_email.should_not be_valid
   # end

  it "should be display_counter null" do 
    ad.display_counter.should eq(0)
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
