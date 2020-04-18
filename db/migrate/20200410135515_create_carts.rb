# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
  end
end
