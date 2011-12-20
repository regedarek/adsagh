# encoding: UTF-8
require 'spec_helper'

describe "New ad specs" do
 before(:all) do
    @ads = Array.new(3) { Ad.sham!(:advertiser_id => 1, :verification_date => Time.now) } 
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

    it "creates a new ad" do
      visit root_path
      click_on "Dodaj ogłoszenie"
      fill_in 'Title', :with => 'Nerka do sprzedania'
      fill_in 'Ad content', :with => 'sprzedam nieswoja nerke'
      fill_in 'Name', :with => 'Czesio'
      fill_in 'Email', :with => 't@t6.pl' 
      fill_in 'Price', :with => '9,76'
      click_on 'Dodaj ogłoszenie'
      current_path.should eq(root_path)
      flash_notice!("Ogłoszenie przekazane do weryfikacji")
    end
  end
end
