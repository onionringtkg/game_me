# frozen_string_literal: true

class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :name, null: false
      t.integer :delivery_fee, null: false
      t.integer :minimum_order_amount, null: false, default: 1
      t.boolean :suspended, null: false, default: false
      t.boolean :restrict_reception_time, null: false, default: true
      t.integer :reception_start_time_hour, null: false, default: 10
      t.integer :reception_start_time_min, null: false, default: 0
      t.integer :reception_end_time_hour, null: false, default: 20
      t.integer :reception_end_time_min, null: false, default: 0

      t.timestamps
    end

    add_index :shops, :name, unique: true
  end
end
