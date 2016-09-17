# coding: utf-8
require 'test_helper'

# No rails eu posso simplesmente fazer testes só no models quando quero.
class UserTest < ActiveSupport::TestCase
#teste para validar
	test "require name" do 
		#se instanciar um objeto como o nome nulo, e salvar...
		user = User.create(name: nil)
		assert user.errors[:name] #eu espero que o usuario tenha erros no attr name
	end

  test "requires email" do
    user = User.create(email: nil)
    assert user.errors[:email].any?
  end


  test "requires valid email" do
    user = User.create(email: "invalid")
    assert user.errors[:email].any?
  end

  %w[
"john@example.org"
john@example.me
jogn@example-domain.com
  ].each do |email|
    test "accepts #{email}" do
      user = User.create(email: email)
      assert user.errors[:email].empty?
    end
  end
end
