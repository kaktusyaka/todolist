ENV['RAILS_ENV'] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'spork'
require 'factory_girl_rails'
require 'faker'
require 'debugger'
require 'capybara/cucumber'
require 'cucumber/rails/world'

Spork.prefork do
  require 'cucumber/rails'
  require 'email_spec' # add this line if you use spork
  require 'email_spec/cucumber'

  Capybara.default_selector = :css

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end

Spork.each_run do

  ActionController::Base.allow_rescue = false

  begin
    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation

end
