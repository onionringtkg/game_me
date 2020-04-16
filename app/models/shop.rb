# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :order_histories, dependent: :nullify
end
