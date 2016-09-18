# coding: utf-8
require 'test_helper'
class SignupTest < ActionDispatch::IntegrationTest
    test "sign up with valid data" do
        visit "/"
        click_link t("menu.signup")
        fill_in label("user.name"), with: "John Doe"
        fill_in label("user.email"), with: "john@example.com"
        fill_in label("user.login"), with: "johndoe"
        fill_in label("user.password"), with: "test"
        fill_in label("user.password_confirmation"), with: "test"
        click_button create_button(:user) ## espero que aconteca

        assert_equal "/login", current_path #espera que eles sao iguais
        assert_notice_message("signup.create") #espera que o valor seja verdadeiro
    end

    test "sign up with invalid data" do
      visit "/"
      click_link t("menu.signup")
      click_button create_button(:user) ## espero que aconteca
      assert_equal "/signup", current_path # ou seja, espera que ele continue na mesma página, avisando o erro
      assert_form_error_message
    end
end
