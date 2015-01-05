class AuthenticationController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @sign_in_error = "Username / password combination is invalid"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
