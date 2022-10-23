class UsersController < ApplicationController
  before_action :move_to_index, except: [:index]
 
  def index
    @user = User.all 
  end

  def new
    @user = User.new
  end

  def create
    @user = create(user_params)
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  def edit
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end


  