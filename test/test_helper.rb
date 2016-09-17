ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara'
require 'capybara/rails'
require 'capybara/dsl'

module IntegrationHelpers
  def t(*args) #0..infinito
    I18n.t(*args)
  end
end
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include IntegrationHelpers
end
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
