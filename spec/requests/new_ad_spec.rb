# encoding: UTF-8
require 'spec_helper'

describe "New ad specs" do
  before(:all) do
    @ads = Array.new(3) { Ad.sham!(:advertiser_id => 1, :verification_date => Time.now) } 
    Category.sham!
  end

  describe "On the root_path" do
    it "listing all ads" do
      visit root_path
      page.should have_selector(".title", :text => "Lista ogłoszeń")
      page.should have_selector(".ad", :count => 3)
      @ads.each do |ad|
        page.should have_css(".ad", :text => ad.title )
      end
    end

    it "create ad by advertiser who is not in database" do
      visit root_path
      click_on "Dodaj ogłoszenie"
      fill_in 'ad_title', :with => 'Nerka do sprzedania'
      fill_in 'ad_ad_content', :with => 'sprzedam nieswoja nerke'
      fill_in 'ad_name', :with => 'Czesio'
      fill_in 'Kategoria', :with => '1'
      fill_in 'ad_email', :with => 't@t6.pl' 
      fill_in 'ad_price', :with => '9,76'
      page!
      click_on 'Dodaj ogłoszenie'
      current_path.should eq(root_path)
      flash_notice!("Ogłoszenie przekazane do potwierdzenia emaila!")
    end

    it "create ad by adveritiser who is in database" do
      adv = Advertiser.sham!
      visit root_path
      click_on "Dodaj ogłoszenie"
      fill_in 'ad_title', :with => 'Nerka do sprzedania'
      fill_in 'ad_ad_content', :with => 'sprzedam nieswoja nerke'
      fill_in 'ad_name', :with => adv.name
      fill_in 'Kategoria', :with => '1'
      fill_in 'ad_email', :with => adv.email 
      fill_in 'ad_price', :with => '9,76'
      click_on 'Dodaj ogłoszenie'
      flash_notice!("Ogłoszenie przekazane do weryfikacji!")
    end
  end
end
