# encoding: UTF-8
require 'spec_helper'

describe "Searches specs" do
  before(:each) do
    @rad1 = Ad.sham!(:title => "Batman and Kevin", :advertiser_id => 1, :price => 11, :verification_date => Time.now)
    @rad2 = Ad.sham!(:title => "Batman or Superman", :advertiser_id => 1, :verification_date => Time.now)
    @rad3 = Ad.sham!(:title => "Batman and Roger", :advertiser_id => 1, :price => 15, :verification_date => Time.now)
    @rad4 = Ad.sham!(:title => "Batman Almighty", :advertiser_id => 1, :price => 13, :verification_date => Time.now)
  end

  it "search results" do
    visit new_search_path
    within("#search_form") do
      fill_in 'search_keywords', :with => 'Batman'
      fill_in 'search_min_price', :with => 12
      click_button 'Wyszukaj'
    end
    current_path.should == search_path(1)
    page.should have_css("div.results li", :count => 2)
  end
end
