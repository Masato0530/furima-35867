class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_id_search
  before_action :correct_user, only: :index
 
  def index
    @history_buy = HistoryBuy.new
  end

  def create
    @history_buy = HistoryBuy.new(history_params)
    if @history_buy.valid?
      @history_buy.save
      pay_item
      return redirect_to root_path
    else
      render :index
    end
  end

  private


  def item_id_search
    @item = Item.find(params[:item_id])
  end

  def correct_user
    if @item.user == current_user || @item.history.present?
      redirect_to root_path
    end
  end

  def history_params
    params.require(:history_buy).permit(:post_code, :shipping_area_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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
