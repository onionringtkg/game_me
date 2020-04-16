# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :shop
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :nullify
end
