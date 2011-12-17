# encoding: UTF-8
require 'acceptance/acceptance_helper'


feature 'Sessions' do
  let :admin do
    Factory :admin
  end
  let :invalid_admin do
    mock :admin, { :username => "invalid_username", :password => "s" }
  end

	context "User logs in" do
    scenario 'succesfully' do
      log_in admin 
      page.should have_content 'Zalogowano pomyślnie!'
      current_path.should == verifications_path
    end

    scenario 'unsuccesfully' do
      log_in invalid_admin 
      page.should have_content 'Źle wpisałeś nazwę lub hasło!'
      current_path.should == sessions_path
    end
	end

  context "User log out" do
		scenario 'should be able to log out' do
			log_in admin
      page.should have_content("Wyloguj")
			visit '/wyloguj'
      page.should have_content("Wylogowano pomyślnie")
		end
	end
end
