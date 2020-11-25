class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderSeparate.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @order = OrderSeparate.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_separate).permit(:prefecture_id, :post_number, :address_1, :address_2,\
      :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
