# encoding: UTF-8
require 'acceptance/acceptance_helper'
require 'spec_helper'

feature 'Verification' do
  background do
    @ad1 = Factory(:ad) 
    @ad2 = Factory(:ad, :email => "czesio2@example.com", :email_id => 2) 
    @admin = Factory(:admin)
	end

  scenario "access denied for guest" do
    visit verifications_path
    page.should have_content "Musisz być zalogowany!"
  end
  scenario "show me only confirm ads" do
    log_in @admin 
    current_path.should eql(verifications_path)
    page.should_not have_content @ad1.name
    page.should have_content @ad2.name
    page.should have_content @ad2.ad_content
	end
  scenario "confirm unverified ad" do
    visit root_path
    page.should_not have_content @ad2.ad_content
    log_in @admin
    current_path.should eql(verifications_path)
    page.should have_content @ad2.name
    page.should have_content @ad2.ad_content
    click_link "Weryfikuj"
    current_path.should eql(verifications_path)
    page.should have_content("Zweryfikowano pomyślnie!")
    visit root_path
    page.should have_content @ad2.title
  end
  scenario "discard unverified ad", :focus do
    log_in @admin
    page.should have_content @ad2.name
    click_link "Odrzuć"
    current_path.should eql(verifications_path)
    page.should have_content("Odrzucono ogłoszenie!")
    page.should_not have_content @ad2.name
  end
end
