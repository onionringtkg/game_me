# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :menu_item

  delegate :name, to: :menu_item
  delegate :price, to: :menu_item

  after_destroy do
    cart.destroy if cart.cart_items.empty?
  end
end
