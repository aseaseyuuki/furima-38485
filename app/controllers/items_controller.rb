class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit]
  before_action :correct_post,only: [:edit]

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

  def edit
  end

  def update
      @item = Item.find(params[:id])
     if @item.update(item_params) 
      redirect_to items_path(@item)
     else
      render :edit
     end 
  end

  def show
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :shipping_origin_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

 def set_item
  @item = Item.find(params[:id])
 end

 def correct_post
  @item = Item.find(params[:id])
  unless user_signed_in? && current_user.id == @item.user_id
   redirect_to root_path
  end
 end
end

