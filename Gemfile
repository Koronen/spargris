source 'http://rubygems.org'

# Rails itself
gem 'rails', '~> 3.0.9'

# Deploy with Capistrano
gem 'capistrano'

# Authentication
gem 'authlogic', '~> 3.0.3', :git => 'git://github.com/binarylogic/authlogic.git'
#gem 'devise'

# Authorization
#gem 'cancan'

# Markup
gem 'haml-rails'
#gem 'RedCloth'
gem 'formtastic'
gem 'jquery-rails'
gem 'cocoon'
#gem 'simple-navigation'

# Structure
gem 'acts-as-taggable-on', :git => 'git://github.com/mbleigh/acts-as-taggable-on.git'
#gem 'acts_as_tree' => 'git://github.com/rails/acts_as_tree.git'
#gem 'friendly_id'
gem 'kaminari'

# I18n
gem 'i18n_routing', :git => 'http://github.com/kwi/i18n_routing'

# Production gems
group :production do
  gem 'mysql2'
end

# Development and test gems
group :development, :test do
  gem 'sqlite3-ruby'
  gem 'mysql2'

  gem 'ruby-debug19'

  gem 'rspec'
  gem 'rspec-rails'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end

