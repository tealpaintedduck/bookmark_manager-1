require File.join(File.dirname(__FILE__), '..', 'app/bookmark_manager.rb')

require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl'
require './spec/helpers/session'
require_relative './factories/user'

Capybara.app = BookMarkManager

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.include SessionHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
