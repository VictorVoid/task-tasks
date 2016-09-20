# coding: utf-8
require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

  test "with valid credentials" do
    user = User.create!(
      name: "John",
      email: "john@example.org",
      login: "john",
      password: "test",
      password_confirmation: "test"
    )

    visit "/"
    click_link t("menu.login")
    fill_in label("login.credential"), with: user.email
    fill_in label("login.password"), with: "test"
    click_button t("buttons.login")

    assert_equal "/task", current_path

  end

  test "with invalid credentials" do
    visit "/"
    click_link t("menu.login")
    click_button t("buttons.login")

    assert_equal "/login", current_path
    assert_alert_message("login.create")
  end

  test "when already logged in" do

  end
end
