# encoding: UTF-8
require 'spec_helper'

describe Ad do
  let(:ad) { Ad.sham!(:build) }

  specify { ad.should be_valid }

  it "not creates a new instane given a invalid attribute" do
    ad = Ad.new
    ad.should_not be_valid
  end

  [:title, :category_id, :email, :ad_content, :name, :price].each do |attr|
    it "should require a #{attr}" do
      subject.valid?
      subject.errors[attr].should include("nie może być puste") 
    end
  end

  it "should reject names that are too short" do
    ad.name = "a" * (Settings.ad.min_name_size - 1)
    ad.should_not be_valid
  end

  it "should reject names that are too long" do
    ad.name = "a" * (Settings.ad.max_name_size + 1)
    ad.should_not be_valid
  end

  it "should accept valid email" do
    %w[user@foo.com THE_USER@foo.bar.org fi.rst@foo.jp].each do |address|
      ad.email = address
      ad.should be_valid
    end
  end

  it "should reject invalid email" do
    %w[user@foo,com The_USER_at_fd.org example.g@ffd.].each do |address|
      ad.email = address 
      ad.should_not be_valid
    end
  end

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
