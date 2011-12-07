source 'http://rubygems.org'

# Rails itself
gem 'rails', '~> 3.0.9'

# Database engine
gem 'mysql2'

# Deploy with Capistrano
gem 'capistrano'

# Authentication
gem 'devise'

# Authorization
#gem 'cancan'

# Markup
gem 'haml-rails'
#gem 'RedCloth'
gem 'formtastic'
gem 'jquery-rails'
gem 'cocoon', '~> 1.0.5'
#gem 'simple-navigation'

# Structure
gem 'acts-as-taggable-on', '~> 2.1.1'
#gem 'friendly_id'
gem 'kaminari', '~> 0.12.4'

# I18n
gem 'i18n_routing', '~> 0.5.0'

# Production gems
group :production do
  gem 'unicorn'
end

# Development gems
group :development do
  gem 'ruby-debug19'
end

# Development and Test gems
group :development, :test do
  gem 'rspec-rails'
end

# Test gems
group :development, :test do
  gem 'cucumber-rails'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end
