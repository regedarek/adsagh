# encoding: UTF-8
require 'acceptance/acceptance_helper'

feature 'Edit ad' do
  background do
    @ad1 = Factory(:ad) 
    @ad2 = Factory(:ad, :email => "czesio_drugi@example.com", :id => 100, :token => "secret_token") 
  end

  scenario 'with token link form email' do
       visit 'http://0.0.0.0/ads/edit/100/secret_token' 
       page.should have_content("Edytuj ogłoszenie")
       fill_in 'ad_title', :with => "Nerka100"
       fill_in 'ad_price', :with => "77"
       fill_in 'ad_ad_content', :with => "content100"
       click_button 'Zapisz zmiany'
       page.should have_content 'Nerka100'
       page.should have_content '77'
       page.should have_content 'content100'
  end
end
