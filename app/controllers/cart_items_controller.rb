# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    current_cart = current_cart(shop_id: params[:shop_id])
    current_cart.add(cart_item)
    if current_cart.save
      unless user_signed_in? ||
             (session[:cart_ids] ||= []).include?(current_cart.id)
        session[:cart_ids].push(current_cart.id)
      end
    end
    if params[:go_menu]
      redirect_to "/shops/#{params[:shop_id]}/menu_items",
                  notice: "カートに追加しました。"
    else
      redirect_to "/shops/#{params[:shop_id]}/cart"
    end
  end

  def update
    current_cart = current_cart(shop_id: params[:shop_id])
    cart_item = current_cart.cart_items.find(params[:id])
    cart_item.assign_attributes(cart_item_params)
    cart_item.save
    redirect_to "/shops/#{params[:shop_id]}/cart"
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to "/shops/#{params[:shop_id]}/cart"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(
      :menu_item_id,
      :number
    )
  end
end
