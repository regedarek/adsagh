# encoding: UTF-8
require 'acceptance/acceptance_helper'

feature 'Sessions' do
	let(:admin) { create(:admin) }

	context "log in" do
		let(:admin) { create(:admin) }

		before(:each) do
			visit '/zaloguj'
		end
		scenario 'should have a username field' do
			page.should have_content('Nazwa')
		end
		scenario 'should have a password field' do
			page.should have_content('Hasło')
		end
		scenario 'should be able to login' do
			visit new_session_path 
			fill_in 'Nazwa', :with => admin.username
			fill_in 'Hasło', :with => "z"
			# save_and_open_page
			click_button('Zaloguj')
			current_path.should eql "/"
			page.has_content?('Zalogowano pomyślnie.')
			page.should have_content("Wyloguj")
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
