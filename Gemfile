source 'http://rubygems.org'

# Rails itself
gem 'rails', '~> 3.1.0'

# Database engine
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
 
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
 
  gem 'uglifier', '>= 1.0.3'
end

# Deploy with Capistrano
gem 'capistrano'

# Authentication
gem 'devise', '~> 2.0.0'

# Authorization
#gem 'cancan'

# Markup
gem 'haml-rails'
gem 'less-rails-bootstrap'
gem 'formtastic'
gem 'formtastic-bootstrap', git: 'git://github.com/cgunther/formtastic-bootstrap.git', branch: 'bootstrap-2'
gem 'jquery-rails'
gem 'cocoon'

# Structure
gem 'acts-as-taggable-on'
#gem 'friendly_id'
gem 'kaminari'
gem 'simple-navigation'

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

# Development and test gems
group :development, :test do
  gem 'rspec-rails'
end

# Test gems
group :test do
  gem 'cucumber-rails'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'database_cleaner'
  gem 'capybara'

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-cucumber'

  gem 'rb-inotify'
  gem 'libnotify'
end
