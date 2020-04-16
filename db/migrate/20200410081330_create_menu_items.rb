# frozen_string_literal: true

class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.references :shop, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
