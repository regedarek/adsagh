# encoding: UTF-8
require 'spec_helper'
describe 'Verification' do
  before(:all) do
    @ad1 = Ad.sham!(:advertiser_id => 1, :verification_date => Time.now, :level => 2)
    @ad2 = Ad.sham!(:advertiser_id => 2)
    @admin = Admin.sham!
  end

  describe 'On verification page' do
    it "access denied for guest" do
      visit verifications_path
      flash_alert!("Musisz być zalogowany!")
    end

    it "show me only confirm ads" do
      log_in @admin
      current_path.should eql(verifications_path)
      # page!
      page.should_not have_selector(:name, :text => @ad1.name)
      assert_seen(@ad2.name, :within => :name)
      assert_seen(@ad2.title, :within => :title)
      page.should have_selector(:name, :count => 1)
    end

    it "confirm unverified ad" do
      visit root_path
      page.should_not have_selector(:ad_content, :text => @ad2.ad_content)
      log_in @admin
      assert_seen(@ad2.name, :within => :name)
      assert_seen(@ad2.title, :within => :title)
      click_link @ad2.title
      click_link "Weryfikuj"
      current_path.should eql(verifications_path)
      flash_notice!("Zweryfikowano pomyślnie!")
      last_email.to.should include(@ad2.email)
      visit root_path
    end

    it "discard unverified ad" do
      log_in @admin
      page.should have_content @ad2.name
      click_link @ad2.title
      page.should have_content("Powód")
      fill_in :discard_info, :with => "bo nie"
      click_button "Wyślij"
      last_email.body.should include("bo nie")
      current_path.should eql(verifications_path)
      flash_notice!("Odrzucono ogłoszenie!")
      page.should_not have_selector(:name, :text => @ad2.name)
    end
  end
end
