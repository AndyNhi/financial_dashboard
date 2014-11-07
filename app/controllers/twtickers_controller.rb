class TwtickersController < ApplicationController

  def create
    @tick = Twticker.new(params.require(:twticker).permit(:tick_name, :user_id))
    @tick.save
    # @user = User.find_by
    redirect_to user_account_path(@user)
  end

end
