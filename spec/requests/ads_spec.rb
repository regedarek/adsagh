# encoding: UTF-8
require 'spec_helper'

describe "Ads" do
  before(:each) do
   @attr = { :title => "Nerka",
             :name => "Czesio",
             :email => "t@ts.pl",
             :ad_content => "sprzedam nerke",
             :phone_number => "662284020",
             :price => "9.99",
             :email_id => "1",
             :verification_date => "2011-12-17 01:24:36.5098452"
   }
  end  

  describe "GET /ads" do
    it "display some ads" do
      @ad = Ad.create!(@attr)
      visit ads_path
      page.should have_content 'Nerka'
    end

    it "creates a new ad" do
      visit ads_path
      click_link "Dodaj ogłoszenie"
      fill_in 'Title', :with => 'Nerka do sprzedania'
      fill_in 'Ad content', :with => 'sprzedam nieswoja nerke'
      fill_in 'Name', :with => 'Czesio'
      fill_in 'Email', :with => 't@t6.pl' 
      fill_in 'Price', :with => '9,76'
      click_button 'Dodaj ogłoszenie'
      current_path.should == root_path
    end
  end
end