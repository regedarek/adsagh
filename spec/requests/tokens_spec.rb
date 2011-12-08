# encoding: UTF-8

require 'spec_helper'

describe "Tokens" do
  it "emails user with token when he creates ad", :focus => true do
    visit new_ad_path
    fill_in "ad_title", :with => "fsdfsd" 
    fill_in "ad_ad_content", :with => "fsdfsd" 
    fill_in "ad_price", :with => "5,33" 
    fill_in "ad_name", :with => "fsfdsk" 
    fill_in "ad_email", :with =>"d@d.pl" 
    fill_in "ad_phone_number", :with => "662284020" 
    click_button 'Dodaj ogłoszenie'
    # save_and_open_page
    current_path.should eql(root_path)

    last_email.body.should include(@ad.email)

  end
end
