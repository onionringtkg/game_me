# frozen_string_literal: true

class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
end
