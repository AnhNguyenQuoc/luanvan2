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

ActiveRecord::Schema.define(version: 2018_11_13_213955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "description", default: ""
    t.integer "rating", default: 0
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_comments_on_restaurant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.integer "amount", default: 0
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "cart_id"
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "order_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total"
    t.string "note"
    t.integer "feeship"
    t.integer "buyer_id"
    t.integer "shipper_id"
    t.integer "payments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_type_id", default: 1
    t.string "card_token"
    t.index ["order_type_id"], name: "index_orders_on_order_type_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.bigint "product_type_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id"
  end

  create_table "restaurant_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.integer "phone", null: false
    t.string "address", null: false
    t.string "description", null: false
    t.time "timeopen", null: false
    t.time "timeclose", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "district_id"
    t.bigint "restaurant_type_id"
    t.index ["district_id"], name: "index_restaurants_on_district_id"
    t.index ["restaurant_type_id"], name: "index_restaurants_on_restaurant_type_id"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.string "username", default: ""
    t.string "address", default: ""
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "district_id"
    t.string "uid"
    t.string "provider"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["district_id"], name: "index_users_on_district_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "comments", "restaurants"
  add_foreign_key "comments", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "order_types"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "restaurants"
  add_foreign_key "restaurants", "districts"
  add_foreign_key "restaurants", "restaurant_types"
  add_foreign_key "restaurants", "users"
  add_foreign_key "users", "districts"
  add_foreign_key "users", "roles"
end
