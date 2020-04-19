# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_11_232445) do

  create_table "cart_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "number", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["menu_item_id"], name: "index_cart_items_on_menu_item_id"
  end

  create_table "carts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_carts_on_shop_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "menu_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_menu_items_on_shop_id"
  end

  create_table "order_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shop_id"
    t.string "orderer_name", null: false
    t.string "orderer_address", null: false
    t.string "orderer_phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_order_histories_on_shop_id"
    t.index ["user_id"], name: "index_order_histories_on_user_id"
  end

  create_table "ordered_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "menu_item_id"
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_ordered_items_on_menu_item_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "name", null: false
    t.integer "delivery_fee", null: false
    t.integer "minimum_order_amount", default: 1, null: false
    t.boolean "suspended", default: false, null: false
    t.boolean "restrict_reception_time", default: true, null: false
    t.integer "reception_start_time_hour", default: 10, null: false
    t.integer "reception_start_time_min", default: 0, null: false
    t.integer "reception_end_time_hour", default: 20, null: false
    t.integer "reception_end_time_min", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shops_on_name", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "menu_items"
  add_foreign_key "carts", "shops"
  add_foreign_key "carts", "users"
  add_foreign_key "menu_items", "shops"
  add_foreign_key "order_histories", "shops"
  add_foreign_key "order_histories", "users"
  add_foreign_key "ordered_items", "menu_items"
end
