class OrdersController < ApplicationController
  def index
    @history_buy = HistoryBuy.new
  end

  def create
    @history_buy = HistoryBuy.create(history_params)
  end

  private

  def history_params
    params.require(:history_buy).permit(:post_code, :shipping_area_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
end
