class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :correct_post,only: [:edit]
  before_action :set_tweet, only: [:show, :edit]
  
  

  def index
    @items = Item.all
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :shipping_origin_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

 def set_tweet
  @item = Item.find(params[:id])
 end

 def correct_post
  @item = Item.find(params[:id])
  unless @item.user.id != current_user.id
   redirect_to root_path
  end
 end
end
