# frozen_string_literal: true

class CartsController < ApplicationController
  def index; end

  def show
    @shop = Shop.find(params[:shop_id])
    @cart = current_cart(params[:shop_id])
  end

  def edit; end

  def update; end

  def add
    cart = current_cart(params[:shop_id])
    cart_item = CartItem.new(cart_item_params)
    cart_item.menu_item_id = params[:menu_item_id]
    cart.add(cart_item)
    cart.save!
    unless user_signed_in? || (session[:cart_ids] ||= []).include?(cart.id)
      session[:cart_ids].push(cart.id)
    end
    if params[:go_menu]
      shop = Shop.find(params[:shop_id])
      redirect_to [shop, :menu_items]
    else
      redirect_to action: :show
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(
      :number
    )
  end
end
