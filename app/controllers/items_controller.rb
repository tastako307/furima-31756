class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :check_user, only: [:destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
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

  def destroy
    @item.destroy
    redirect_to root_path
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :deadline_id, :prefecture_id, :condition_id, :fee_id, :price, :name, :text).merge(user_id: current_user.id)
  end

  def check_user
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end
