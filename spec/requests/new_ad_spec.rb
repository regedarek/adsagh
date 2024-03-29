# encoding: UTF-8
require 'spec_helper'

describe "New ad specs" do
  describe "On the root_path" do

    it 'goes to new ad path' do
      visit root_path
      click_link "Dodaj ogłoszenie"
      current_path.should eq(new_ad_path)
    end

    it "create ad by advertiser who is not in database" do
      visit new_ad_path
      fill_in 'ad_title', :with => 'Nerka do sprzedania'
      fill_in 'ad_ad_content', :with => 'sprzedam nieswoja nerke'
      fill_in 'ad_name', :with => 'Czesio'
      fill_in 'Kategoria', :with => '1'
      fill_in 'ad_email', :with => 't@t6.pl'
      fill_in 'ad_price', :with => '9,76'
      click_on 'Dodaj ogłoszenie'
      current_path.should eq(root_path)
      flash_notice!("Ogłoszenie przekazane do potwierdzenia emaila!")
    end

    it "create ad by adveritiser who is in database" do
      adv = Advertiser.sham!
      visit new_ad_path
      fill_in 'ad_title', :with => 'Nerka do sprzedania'
      fill_in 'ad_ad_content', :with => 'sprzedam nieswoja nerke'
      fill_in 'ad_name', :with => adv.name
      fill_in 'Kategoria', :with => '1'
      fill_in 'ad_email', :with => adv.email
      fill_in 'ad_price', :with => '9,76'
      click_on 'Dodaj ogłoszenie'
      # page!
      flash_notice!("Ogłoszenie przekazane do weryfikacji!")
    end

    it "show errors" do
      visit new_ad_path
      fill_in 'ad_title', :with => 'gf'
      fill_in 'ad_ad_content', :with => 'gfd'
      fill_in 'ad_name', :with => 'hgf'
      fill_in 'Kategoria', :with => ''
      fill_in 'ad_email', :with => ''
      fill_in 'ad_price', :with => ''
      click_on 'Dodaj ogłoszenie'
      all('span.error').count.should == 3
    end
  end
end
