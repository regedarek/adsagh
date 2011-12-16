# encoding: UTF-8
require 'acceptance/acceptance_helper'

feature 'Sessions' do

	context "User logs in" do
		before(:each) do
			visit '/zaloguj'
		end
    
    scenario 'succesfully', :focus do
      log_in Factory(:admin)
      page.should have_content 'Zalogowano pomyślnie.'
      current_path.should == root_path
    end
	end

	context "log out" do
		scenario 'should be able to log out' do
			log_in(admin)
			page.should have_content("Wyloguj")
			visit '/wyloguj'
			page.should have_content("Zaloguj")
		end
	end
end
