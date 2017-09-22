# frozen_string_literal: true

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  ActiveRecord::Migration.check_pending!
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end

require 'simplecov'
SimpleCov.start 'rails'
