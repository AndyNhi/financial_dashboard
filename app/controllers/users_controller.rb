class UsersController < ApplicationController

  def create
    @user = User.new(params.require(:user).permit(:email, :name, :password, :password_confirmation))
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit( :email, :name, :password, :password_confirmation))
    @user.save
    redirect_to user_account_path
  end

  def sign_in_sign_up
    @user = User.new
  end

  def show
    @user = User.find(current_user[:id])
  end



end
