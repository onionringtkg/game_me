# frozen_string_literal: true

class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.references :order, foreign_key: true, null: false
      t.references :menu_item, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
