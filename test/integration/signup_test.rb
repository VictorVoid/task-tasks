# coding: utf-8
require 'test_helper'
class SignupTest < ActionDispatch::IntegrationTest
    test "sign up with valid data" do
        visit "/"
        click_link t("menu.signup")

        fill_in t("labels.user.name"), with: "John Doe"
        fill_in t("labels.user.email"), with: "john@example.com"
        fill_in t("labels.user.login"), with: "johndoe"
        fill_in t("labels.user.password"), with: "test"
        fill_in t("labels.user.password_confirmation"), with: "test"
        click_button t("helpers.submit.user.create")
      ## espero que aconteca
        assert_equal "/login", current_path #espera que eles sao iguais
        assert page.has_content?("Cadastrado realizado com sucesso!") #espera que o valor seja verdadeiro
    end
    test "sign up with invalid data" do
        visit "/"
        click_link t("menu.signup")
        click_button t("helpers.submit.user.create")

        assert_equal "/signup", current_path # ou seja, espera que ele continue na mesma página, avisando o erro 
        assert page.has_content?("Verifique o formulário antes de continuar") #espera que o valor seja verdadeiro
    end
end
