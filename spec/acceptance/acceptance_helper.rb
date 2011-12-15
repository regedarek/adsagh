# encoding: UTF-8
require 'spec_helper'
require "steak"
require 'capybara/rails'

# Put your acceptance spec helpers inside spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

def log_in(admin)
  visit '/zaloguj'
  fill_in('Nazwa', :with => user.username)
  fill_in('Hasło', :with => 'z')
  click_button('Zaloguj')
end