class OrdersController < ApplicationController
  def index
    @history_buy = HistoryBuy.new
  end

  def create
    @history_buy = HistoryBuy.new(history_params)
    
    if @history_buy.valid?
      pay_item
      @history_buy.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history_buy).permit(:post_code, :shipping_area_id, :city, :address, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end
end
