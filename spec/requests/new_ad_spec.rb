# encoding: UTF-8
require 'spec_helper'

describe "New ad specs" do
    let!(:advertiser) { FactoryGirl.create(:advertiser) }
    # let!(:ad1) { FactoryGirl.create(:ad, :email => "czesio@gmail.com", :email_id => advertiser.id, :verification_date => Time.now) }
    # let!(:ad2) { FactoryGirl.create(:ad, :email => "czesio2@gmail.com", :email_id => advertiser.id, :verification_date => Time.now) }
  before(:all) do
    @ads = []
    # 3.times{ @ads << FactoryGirl.create(:ad, :email_id => 1, :verification_date => Time.now) }
  end
  describe "aa" do
    it "listing all ads" do
      visit ads_path
      # within(".title") do
      #   page.should have_content("Lista ogłoszeń")
      # end
      # page.has_selector?(".ad", :count => 2).should be_true
      # page.should have_css(".ad", :content => )
      @ads.each do |ad|
        page.should have_content(ad.title)
      end
    end
  end
end
