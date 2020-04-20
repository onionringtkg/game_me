class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    user = current_user
    shop = Shop.find(params[:shop_id])
    @order = Order.new(user_id: user.id,
                       shop_id: shop.id,
                       orderer_name: user.name,
                       orderer_address: user.address,
                       orderer_phone_number: user.phone_number,
                       delivery_fee: shop.delivery_fee)
    session[:order] = @order.attributes
    cart = current_cart(shop_id: shop.id)
    session[:order][:ordered_items_attributes] = []
    cart.cart_items.each do |cart_item|
      menu_item = cart_item.menu_item
      ordered_item = @order.ordered_items.build(menu_item_id: menu_item.id,
                                                name: menu_item.name,
                                                price: menu_item.price,
                                                number: cart_item.number)
      session[:order][:ordered_items_attributes] << ordered_item.attributes
    end
  end

  def create
    order = Order.new(session[:order])
    if order.save
      cart = current_cart(shop_id: order.shop.id)
      cart.destroy
    end
    redirect_to :orders
  end
end
