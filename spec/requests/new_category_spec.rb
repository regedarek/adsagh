# encoding: UTF-8
require 'spec_helper'

describe 'Categories' do
	before(:all) do
    @categories = Array.new(2) { Category.sham! } 
	end	
	describe "On the categories path"
	  it "listing all categories" do
      visit categories_path
      page.should have_selector(".category", :text => "")
    end

	it "creates a new category" do
		visit categories_path
		click_on "Nowa kategoria"
		fill_in 'Nazwa', :with => 'Komputery'
		click_on 'Dodaj Category'
		current_path.should eq("/categories.html")
		flash_notice!("Utworzono kategorię")
	end

end
