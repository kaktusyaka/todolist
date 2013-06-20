ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'faker'
require 'factory_girl_rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'rspec/rails'
require 'shoulda/matchers/integrations/rspec'
require 'validates_timeliness'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.mock_with :rspec

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
