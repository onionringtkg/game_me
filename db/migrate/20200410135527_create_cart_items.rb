# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true, null: false
      t.references :menu_item, foreign_key: true, null: false
      t.integer :number, null: false, default: 1

      t.timestamps
    end
  end
end
