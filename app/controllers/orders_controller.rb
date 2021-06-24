class OrdersController < ApplicationController
  before_action :correct_user, only: :index
  before_action :move_to_login, only: :index
 
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

  def move_to_login
    unless user_signed_in?
      redirect_to new_item_path
    end
  end

  def correct_user
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def item_history
    @item = Item.find(params[:item_id])
    if @item.history.present?
      redirect_to root_path
    end
  end

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
