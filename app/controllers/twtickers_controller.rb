class TwtickersController < ApplicationController

  def index
    @users_twtickers = Twticker.all(current_user[:id])
  end

  def new
    @user_twticker = Twticker.new
  end

  def create
    @user_twticker = Twticker.new(params.require(:twticker).permite(:tick_name))
    @user_twticker.save
    redirect_to user_path(current_user)
  end

  def destroy
  end


end
