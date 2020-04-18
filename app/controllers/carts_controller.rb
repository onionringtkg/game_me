# frozen_string_literal: true

class CartsController < ApplicationController
  def index; end

  def show
    @cart = current_cart(shop_id: params[:shop_id])
    @shop = @cart.shop
  end
end
