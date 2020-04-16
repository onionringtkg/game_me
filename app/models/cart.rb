# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  # belongs_to :user, optional: true
  belongs_to :session_user, optional: true
  belongs_to :shop

  def count_items
    cart_items.map(&:number).sum
  end

  def add(cart_item)
    current_item = cart_items.find_by(menu_item: cart_item.menu_item)
    if current_item
      current_item.number += cart_item.number
      current_item.save
    else
      cart_items << cart_item
    end
  end
end
