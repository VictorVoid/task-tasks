require 'test_helper'

# No rails eu posso simplesmente fazer testes só no models quando quero.
class UserTest < ActiveSupport::TestCase
#teste para validar
	test "require name" do 
		#se instanciar um objeto como o nome nulo, e salvar...
		user = User.new(name: nil)
		user.save

		assert user.errors[:name] #eu espero que o usuario tenha erros no attr name
	end

end
