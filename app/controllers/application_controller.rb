# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user; end
  def user_signed_in?; end


  helper_method :current_carts

  def current_carts
    if user_signed_in?
      current_user.carts
    else
      Cart.where("id IN (?)", session[:cart_ids])
    end
  end

  def current_cart(shop_id)
    current_carts&.find_by(shop_id: shop_id) ||
      if user_signed_in?
        current_user.carts.create(shop_id: shop_id)
      else
        (cart = Cart.create(shop_id: shop_id))
        (session[:cart_ids] ||= []).push(cart.id)
        cart
      end
  end
end
