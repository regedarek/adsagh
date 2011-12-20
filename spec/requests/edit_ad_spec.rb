# encoding: UTF-8
require 'spec_helper'

describe 'Edit ad' do
  before(:all) do
    @ad = Ad.sham!
  end
  
  describe 'Advertiser try edit ad' do
    it 'with token link form email' do
      visit "http://0.0.0.0/ads/edit/#{@ad.id}/#{@ad.token}" 
      page.should have_content("Edytuj ogłoszenie")
      fill_in 'ad_title', :with => "Nerka100"
      fill_in 'ad_price', :with => "77"
      fill_in 'ad_ad_content', :with => "content100"
      click_button 'Zapisz zmiany'
      assert_seen("Nerka100", :within => :title)
      assert_seen("77", :within => :price)
      assert_seen("content100", :within => :ad_content)
    end

    it 'and cannot without token link' do
      visit edit_ad_path(@ad.id)
      flash_alert!("Musisz posiadać token!")
      current_path.should eq(root_path)
    end
  end
end
