# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :menu_item

  delegate :name, to: :menu_item
  delegate :price, to: :menu_item

  before_destroy do
    cart.destroy if cart.cart_items == [self]
  end
end
