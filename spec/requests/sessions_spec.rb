# encoding: UTF-8
require 'spec_helper'

describe 'Sessions' do
  let :admin do
    Admin.sham!
  end
  let :invalid_admin do
    mock :admin, { :username => "invalid_username", :password => "s" }
  end

	context "User logs in" do
    it 'succesfully' do
      log_in admin
      page.should have_content 'Zalogowano pomyślnie!'
      current_path.should eq(verifications_path)
    end

    it 'unsuccesfully' do
      log_in invalid_admin
      page.should have_content 'Źle wpisałeś nazwę lub hasło!'
      current_path.should eq(sessions_path)
    end
	end

  context "User log out" do
		it 'should be able to log out' do
			log_in admin
      # page.should have_content("Wyloguj")
			visit '/wyloguj'
      page.should have_content("Wylogowano pomyślnie")
		end
	end
end
