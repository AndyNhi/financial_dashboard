class UsersController < ApplicationController

  def new
    @user = User.new
  end

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

  def user_account
    @user = User.find(params[:id])
    @tick = Twticker.new
  end

  # def add_twitter
  #   @user = User.new(params.require(:user).permit(:tw_ticker))
  #   @user.save
  #   redirect_to user_account_path(params[:id])
  # end

end
