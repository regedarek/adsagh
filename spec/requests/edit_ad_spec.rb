# encoding: UTF-8
require 'spec_helper'

describe 'Edit ad' do
  before(:all) do
    @ad = Ad.sham!
    @admin = Admin.sham!
    p
  end
  
  describe 'Advertiser try edit ad' do
    it 'with token link form email' do
     visit "http://0.0.0.0/ads/edit/#{@ad.id}/#{@ad.token}" 
     # visit edit_ad_path(@ad.id)
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
end
