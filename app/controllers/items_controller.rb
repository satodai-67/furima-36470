class ItemsController < ApplicationController

  def index
  end





  
  private
  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
