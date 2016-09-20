class LoginController < ApplicationController
  def new
  end

  def create
    user = User.where("email = :credential OR login = :credential", credential: params[:credential].to_s).first
    authenticated = user && user.password == params[:password]
    if authenticated
      reset_session
      session[:user_id] = user.id
      redirect_to "/task"
    else
      flash.alert = t("flash.login.create.alert")
      render :new

    end
  end
end
