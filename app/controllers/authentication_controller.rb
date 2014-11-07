class AuthenticationController < ApplicationController

  def create  
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @sign_in_error = "Username / password combination is invalid"
      render "users/sign_in_sign_up"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
