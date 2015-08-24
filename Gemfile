source 'https://rubygems.org'

gem 'rails', '~>4.2.3'
gem 'pg'

gem 'auditor'
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'chronic'
gem 'devise'
gem 'jquery-rails'
gem 'modernizr-rails'
gem 'simple_form'
gem 'squeel'
gem 'savon'

gem 'delayed_job_active_record'
gem 'daemons'
gem 'devise-async'
gem 'premailer-rails'
gem 'nokogiri'

gem 'cancan'
gem 'god'

gem 'whenever', require: false

# App server
gem 'unicorn'

gem 'ice_cube'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
		gem 'coffee-rails',     '~> 4.1.0'
		gem 'sass-rails',       '~> 5.0'
		gem 'compass-rails'
		gem 'uglifier',         '~> 1.3.0'
		gem 'flot-rails'
		gem 'turbo-sprockets-rails3'
end

group :development do
		gem 'annotate', :git => 'https://github.com/ctran/annotate_models.git'
		gem 'guard-rspec'
		gem 'mail_view'
		gem 'yaml_db'
	#	gem 'better_errors'
		gem 'binding_of_caller'
	#	gem 'jazz_hands'
end

group :test do
		gem 'capybara'
		gem 'database_cleaner'
		gem 'guard-spork'
		gem 'launchy'
		gem 'shoulda-matchers'
		gem 'spork'
end

group :test, :development do
		# Deployment
		gem 'capistrano'

		gem 'factory_girl_rails'
#		gem 'ffaker',             '>= 1.14.0'
		gem 'rspec-rails'
end
