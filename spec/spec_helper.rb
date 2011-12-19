require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'database_cleaner'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true 
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
    config.include(MailerMacros)
    config.before(:each) { reset_email }
    DatabaseCleaner.strategy = :truncation
    config.before(:each) do
    end
    config.after(:each) do
    end
  end
end

Spork.each_run do
  $rspec_start_time = Time.now  
  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers
  Sham::Config.activate!
  DatabaseCleaner.clean
end


