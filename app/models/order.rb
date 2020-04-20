# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop
  has_many :ordered_items, dependent: :destroy

  accepts_nested_attributes_for :ordered_items
end
