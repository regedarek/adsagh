# encoding: UTF-8
require 'spec_helper'
describe 'Verification' do
  before(:each) do
    @ad1 = Ad.sham!(:email_id => 1, :verification_date => Time.now)
    @ad2 = Ad.sham!(:email_id => 2) 
    @admin = Admin.sham!
  end

  describe 'On verification page' do
    it "access denied for guest" do
      visit verifications_path
      page.should have_content "Musisz być zalogowany!"
    end
    
    it "show me only confirm ads" do
      log_in @admin 
      current_path.should eql(verifications_path)
      page.should_not have_content @ad1.name
      page.should have_content @ad2.name
      page.should have_content @ad2.ad_content
    end
    
    it "confirm unverified ad" do
      visit root_path
      page.should_not have_content @ad2.ad_content
      log_in @admin
      current_path.should eql(verifications_path)
      page.should have_content @ad2.name
      page.should have_content @ad2.ad_content
      click_link "Weryfikuj"
      current_path.should eql(verifications_path)
      page.should have_content("Zweryfikowano pomyślnie!")
      last_email.to.should include(@ad2.email)
      visit root_path
      page.should have_content @ad2.title
    end

    it "discard unverified ad" do
      log_in @admin
      page.should have_content @ad2.name
      click_link "Odrzuć"
      page.should have_content("Powód:")
      fill_in "Powód", :with => "bo nie"
      click_button "Wyślij"
      last_email.body.should include("bo nie")
      current_path.should eql(verifications_path)
      page.should have_content("Odrzucono ogłoszenie!")
      page.should_not have_content @ad2.name
    end
  end
end
