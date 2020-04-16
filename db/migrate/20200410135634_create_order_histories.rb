# frozen_string_literal: true

class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      # t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :addressee, null: false
      t.string :delivery_address, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
