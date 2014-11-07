class TwtickersController < ApplicationController

  def create
    @tick = current_user(Twticker.new(params.require(:twticker).permit(:tick_name)
    @tick.save
    redirect_to user_account_path(@user)
  end

end
