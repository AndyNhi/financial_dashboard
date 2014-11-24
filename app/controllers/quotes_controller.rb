class QuotesController < ApplicationController

  def create
    @user = current_user
    @quote = @user.quotes.new(params.require(:quote).permit(:ticker, :user_id))
    @quote.save
    redirect_to user_path(current_user)
  end

end
