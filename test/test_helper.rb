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

  def label(scope)
    t(scope, scope: "labels")
  end

  def create_button(model)
    t("helpers.submit.#{model}.create")
  end

  def assert_form_error_message
    assert page.has_content?(t("form.error_message")) #espera que o valor seja verdadeiro
  end
  def assert_notice_message(scope)
    assert page.has_content?(t("flash.#{scope}.notice"))
  end
  def assert_alert_message(scope)
    assert page.has_content?(t("flash.#{scope}.alert"))
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
