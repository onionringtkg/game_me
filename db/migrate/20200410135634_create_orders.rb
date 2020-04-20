# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :orderer_name, null: false
      t.string :orderer_address, null: false
      t.string :orderer_phone_number, null: false
      t.integer :delivery_fee, null: false

      t.timestamps
    end
  end
end
