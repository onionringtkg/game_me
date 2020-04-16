# frozen_string_literal: true

class MenuItemsController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @menu_item = MenuItem.find(params[:id])
    @cart_item = CartItem.new(menu_item: @menu_item)
  end
end
