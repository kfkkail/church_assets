# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'minitest/autorun'

Minitest::Reporters.use!
DatabaseCleaner.strategy = :transaction

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
    # order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
