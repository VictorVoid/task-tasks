require 'test_helper'
class SignupTest < ActionDispatch::IntegrationTest
    test "sign up with valid data" do
        visit "/"
        click_link "Quero me cadastrar"

        fill_in "Seu nome", with: "John Doe"
        fill_in "Seu e-mail", with: "John Doe"
        fill_in "Seu login", with: "johndoe"
        fill_in "Sua senha", with: "test"
        fill_in "Confirme sua senha", with: "test"
        click_button "Quero me cadastrar"
      ## espero que aconteca
        assert_equal "/login", current_path #espera que eles sao iguais
        assert page.has_content?("Cadastrado realizado com sucesso!") #espera que o valor seja verdadeiro
    end
    test "sign up with invalid data" do
        visit "/"
        click_link "Quero me cadastrar"
        click_button "Quero me cadastrar"

        assert_equal "/signup", current_path # ou seja, espera que ele continue na mesma página, avisando o erro 
        assert page.has_content?("Verifique o formulário antes de continuar") #espera que o valor seja verdadeiro
    end
end
