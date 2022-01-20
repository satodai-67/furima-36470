class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_furima, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :item_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item.user_id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def set_furima
    @item = Item.find(params[:item_id])
  end
end
