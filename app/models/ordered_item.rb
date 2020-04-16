# frozen_string_literal: true

class OrderedItem < ApplicationRecord
  belongs_to :order_history
end
