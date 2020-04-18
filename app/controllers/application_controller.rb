# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_carts

  def current_carts
    if user_signed_in?
      current_user.carts
    else
      Cart.where("id IN (?)", session[:cart_ids])
    end
  end

  def current_cart(shop_id: shop_id)
    current_carts&.find_by(shop_id: shop_id) ||
      if user_signed_in?
        current_user.carts.build(shop_id: shop_id)
      else
        Cart.new(shop_id: shop_id)
      end
  end
end
