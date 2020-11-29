class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create, :pay_item, :check_order]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :check_order, only: [:index, :create]

  def index
    @order = OrderSeparate.new
  end

  def create
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

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_order
    redirect_to root_path if @item.order.presence || current_user.id == @item.user.id
  end
end
