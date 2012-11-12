source 'https://rubygems.org'

gem 'rails',              '3.2.6'
gem 'pg',                 '0.14.0'

gem 'auditor',            '2.3.1'
gem 'bootstrap-sass',     '2.0.4.0'
gem 'bootstrap-will_paginate', '0.0.7'
gem 'chronic',            '0.7.0'
gem 'devise',             '2.1.2'
gem 'jquery-rails',       '2.0.2'
gem 'modernizr-rails',    '2.0.6'
gem 'simple_form',        '2.0.2'
gem 'squeel',             '1.0.9'
gem 'savon',              '1.1.0'

gem 'delayed_job_active_record'
gem 'daemons'
gem 'devise-async'
gem 'premailer-rails3'
gem 'nokogiri'

gem 'cancan'

gem 'whenever', require: false

# Deployment
gem 'capistrano',         '2.12.0'

# App server
gem 'unicorn'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails',     '>= 3.2.1'
  gem 'sass-rails',       '>= 3.2.3'
  gem 'compass-rails',    '>= 1.0.3'
  gem 'uglifier',         '>= 1.0.3'
  gem 'flot-rails'
end

group :development do
  gem 'annotate',         '>= 2.4.1.beta'
  gem 'bullet'
  gem 'guard-rspec',      '>= 0.5.5'
  gem 'mail_view',        '>= 1.0'
  gem 'pry-rails'
  gem 'yaml_db'
  gem 'flair'
end

group :test do
  gem 'capybara',         '>= 1.1.2'
  gem 'database_cleaner'
  gem 'guard-spork',      '>= 0.3.2'
  gem 'launchy',          '>= 2.1.0'
  gem 'shoulda-matchers'
  gem 'spork',            '>= 0.9.0'
end

group :test, :development do
  gem 'factory_girl_rails', '>= 1.4.0'
  gem 'ffaker',             '>= 1.14.0'
  gem 'rspec-rails',        '>= 2.10'
end