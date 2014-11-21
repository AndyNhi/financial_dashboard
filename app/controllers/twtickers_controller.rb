class TwtickersController < ApplicationController

  before_action do
    @user = User.find(params[:user_id])
  end

  def index
    @twticker = @user.twtickers.all(current_user[:id])
  end

  def create
    @twticker = @user.twtickers.new(params.require(:ticker_add).permit(:user_id, :tick_name))
    @twticker.save
    redirect_to user_path(current_user)
  end

end
