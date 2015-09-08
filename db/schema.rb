# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150907174753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "back_pockets", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bottoms", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "founder"
    t.string   "address"
    t.string   "contact"
    t.string   "dealin"
    t.string   "description"
    t.boolean  "isactive",    default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "chest_pockets", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collars", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "isactive",   default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "designs", force: :cascade do |t|
    t.integer  "order_item_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "discount_type",                 null: false
    t.integer  "value",                         null: false
    t.datetime "valid_from"
    t.datetime "valid_upto"
    t.boolean  "is_active",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "face_prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fits", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "pocket_id"
    t.integer  "back_pocket_id"
    t.string   "avatar"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.string   "measurement_type"
    t.string   "name"
    t.string   "address"
    t.string   "pincode"
    t.string   "mobile"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "order_item_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "pleat_id"
    t.integer  "pocket_id"
    t.integer  "bottom_id"
    t.integer  "placket_id"
    t.integer  "collar_id"
    t.integer  "sleeve_id"
    t.integer  "pant_fastening_id"
    t.integer  "plate_id"
    t.integer  "pant_cuff_id"
    t.integer  "back_pocket_id"
    t.integer  "side_pocket_id"
    t.integer  "fit_id"
    t.integer  "quantity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "order_status"
    t.float    "amount"
    t.float    "tax_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pant_cuffs", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pant_fastenings", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plackets", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plates", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pleats", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pockets", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "code",                        null: false
    t.float    "face_price"
    t.float    "back_price",  default: 0.0
    t.integer  "quantity",                    null: false
    t.integer  "brand_id",                    null: false
    t.integer  "color_id",                    null: false
    t.integer  "seller_id",                   null: false
    t.integer  "discount_id"
    t.boolean  "isactive",    default: true
    t.boolean  "is_sale",     default: false
    t.float    "sale_price",  default: 0.0
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "side_pockets", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sleeves", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "category"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tailors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "seller_id"
    t.integer  "tailor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "",      null: false
    t.string   "role",                   default: "guest"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
