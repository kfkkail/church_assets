# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'minitest/autorun'

Minitest::Reporters.use!
DatabaseCleaner.strategy = :transaction

module Minitest
  class Spec
    before :each do
      DatabaseCleaner.start
    end

    after :each do
      DatabaseCleaner.clean
    end
  end
end

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
    # order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include ActiveJob::TestHelper

    def body(response_body = nil)
      response_body ||= response.body.strip
      begin
        JSON.parse(response_body, symbolize_names: true)
      rescue JSON::ParserError
        response_body
      end
    end
  end
end
