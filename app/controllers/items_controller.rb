class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

    def index
  #  @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def edit
    #@items_tag = ItemsTag.new
  #end


  private
  
  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :shipping_area_id,
      :products_status_id,
      :price,
      :user_id,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
