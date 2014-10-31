class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :name, :password, :password_confirmation))
    @user.save
    redirect_to edit_user_path(@user)
  end

end
