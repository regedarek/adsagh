# encoding: UTF-8
require 'acceptance/acceptance_helper'
require 'spec_helper'

feature 'Verification' do
	background do
    @ad1 = Factory(:ad) 
    @ad2 = Factory(:ad, :email => "czesio2@example.com", :email_id => 2) 
	end
	scenario "show me only confirm ads" do
    visit verifications_path 
    page.should_not have_content @ad1.name
    page.should have_content @ad2.name
    page.should have_content @ad2.ad_content
	end
  scenario "confirm unverified ads" do
  end
end
