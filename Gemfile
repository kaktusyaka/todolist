source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'thin'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'devise'
gem 'cancan'
gem 'simple_form'
gem 'inherited_resources'
gem 'validates_timeliness'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'

group :development do
  gem "better_errors"
  gem 'binding_of_caller'
  gem "erb2haml"
end

group :development, :test do
  gem 'debugger'
  gem "rspec-rails"
  gem "factory_girl_rails"
end

group :test do
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'spork'
end