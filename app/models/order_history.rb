# frozen_string_literal: true

class OrderHistory < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop
  has_many :ordered_items, dependent: :destroy
end
