source 'https://rubygems.org'

gem 'rails',              '3.2.6'
gem 'pg',                 '0.14.0'
gem 'jquery-rails',       '2.0.2'
gem 'modernizr-rails'
gem 'devise'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'chronic'
gem 'squeel'

# Deployment
gem 'capistrano',         '2.12.0'

# App server
gem 'unicorn'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',       '>= 3.2.3'
  gem 'coffee-rails',     '>= 3.2.1'
  gem 'uglifier',         '>= 1.0.3'
end

group :development do
  gem 'mail_view',        '>= 1.0'
  gem 'annotate',         '>= 2.4.1.beta'
  gem 'pry-rails'
  gem 'guard-rspec',      '>= 0.5.5'
  gem 'bullet'
end

group :test do
  gem 'capybara',         '>= 1.1.2'
  gem 'launchy',          '>= 2.1.0'
  gem 'guard-spork',      '>= 0.3.2'
  gem 'spork',            '>= 0.9.0'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'rspec-rails',      '>= 2.10'
  gem 'factory_girl_rails', '>= 1.4.0'
  gem 'ffaker',             '>= 1.14.0'
end