class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :correct_post]
  before_action :correct_post, only: [:index]
 

  def index
    @order_destination = OrderDestination.new
    if current_user == @item.user
       redirect_to root_path
    end
  end

 
  def create
    @order_destination = OrderDestination.new(order_params)
    @item = Item.find(params[:item_id])
  if @order_destination.valid?
     pay_item
     @order_destination.save
     redirect_to root_path
    else 
      render 'index'
    end  
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :shipping_origin_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
   end

  def correct_post
    unless @item.order.nil? 
     redirect_to root_path
    end 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end 
