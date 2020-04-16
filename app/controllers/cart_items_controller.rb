# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create; end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_back(fallback_location: :carts)
  end
end
