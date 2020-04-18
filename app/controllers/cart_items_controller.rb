# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    cart = current_cart(shop_id: params[:shop_id])
    cart.add(cart_item)
    if cart.save
      unless user_signed_in? || (session[:cart_ids] ||= []).include?(cart.id)
        session[:cart_ids].push(cart.id)
      end
    end
    if params[:go_menu]
      redirect_to "/shops/#{params[:shop_id]}/menu_items",
                  notice: "カートに追加しました。"
    else
      redirect_to "/shops/#{params[:shop_id]}/cart"
    end
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
