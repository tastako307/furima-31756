class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :check_order, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderSeparate.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderSeparate.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_separate).permit(:prefecture_id, :post_number, :address_1, :address_2,\
                                           :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_order
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.presence || current_user.id == @item.user.id
  end
end
