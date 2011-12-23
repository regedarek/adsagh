source 'http://rubygems.org'

# Gemy domyślne
gem 'rails', '3.1.1'
gem 'sqlite3'
gem 'mongrel', '>= 1.2.0.pre2'
gem 'jquery-rails'


# Gemy potrzebne do działania aplikacji
gem 'therubyracer'
gem 'ancestry'
gem 'sorcery'

# Gemy wyglądu
gem "haml-rails"
gem 'nifty-generators'
gem 'simple_form'
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# Gemy testów
gem 'letter_opener', :group => :development
gem "rspec-rails", :group => [:test, :development]
group :test do
  gem 'database_cleaner'
  gem "capybara"
  gem 'libnotify', :require => false
  gem 'rb-inotify', :require => false
  gem 'launchy'
  gem 'spork', ">0.9.0.rc"
  gem "guard-rspec"
  gem 'guard-spork'
  gem 'sham'
end


