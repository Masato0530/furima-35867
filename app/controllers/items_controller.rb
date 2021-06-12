class ItemsController < ApplicationController
  
  def index
  end
  
  def items_params
    params.require(:item).permit(content, :image).merge(user_id: current_user.id)
end
