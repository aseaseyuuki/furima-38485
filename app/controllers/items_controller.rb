class ItemsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new]
  before_action :authenticate_user!, except: [:index, :edit]
  

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
      redirect_to edit_user_path(@item.user_id)
     else
      render :new
    end
  end

  def show
    if @item.user_id != current_user.id
      redirect_to root_path
   end
  end

  def edit
  end

  def update
      @item = Item.find(params[:id])
  if  @item.update(item_params) 
      redirect_to items_path(@item)
     else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :shipping_origin_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
<<<<<<< HEAD
end   
=======

 def set_tweet
  @item = Item.find(params[:id])
 end

end
>>>>>>> 5903a2feacd082794c2f6eeae1c6aed139b8aa6a
