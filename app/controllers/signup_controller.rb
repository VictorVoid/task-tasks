class SignupController < ApplicationController
    def new    
    	@user = User.new()
    end

    def create
    #salvar no bd
    	@user = User.new(user_params)
    	@user.save
    	flash.notice = "Cadastrado realizado com sucesso!"
    	redirect_to "/login"
    end

    private
    def user_params
    	params #contem todos os paramestros, enviados pelo from e url
    		.require(:user)
    		.permit(:name, :email, :login, :password, :password_confirmation) #explicito, que apenas esses campos podem.
    end
end 
