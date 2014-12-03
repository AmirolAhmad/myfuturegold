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

ActiveRecord::Schema.define(version: 20141203123732) do

  create_table "announcements", force: true do |t|
    t.integer  "user_id",     null: false
    t.text     "subject",     null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", force: true do |t|
    t.string   "discount_date"
    t.string   "discount_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
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

  create_table "inboxes", force: true do |t|
    t.integer  "user_id",                     null: false
    t.string   "ticket_id"
    t.text     "subject",                     null: false
    t.text     "description",                 null: false
    t.string   "status"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unread",      default: false
  end

  create_table "items", force: true do |t|
    t.integer  "user_id",        null: false
    t.integer  "order_id",       null: false
    t.string   "gram_received"
    t.string   "date_received"
    t.string   "receipt_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "item_type"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id",           null: false
    t.integer  "package_id",        null: false
    t.integer  "discount_id",       null: false
    t.integer  "status_id",         null: false
    t.string   "gram_quantity"
    t.string   "price"
    t.string   "total_price"
    t.string   "ref_number"
    t.datetime "ordered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "restock"
    t.integer  "discount_per_gram"
    t.integer  "total_discount"
  end

  create_table "packages", force: true do |t|
    t.string   "package_name"
    t.integer  "selling_price"
    t.integer  "buying_price"
    t.string   "price"
    t.string   "term_contract"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "user_id",        null: false
    t.integer  "order_id",       null: false
    t.string   "payment_date"
    t.string   "method"
    t.string   "status"
    t.string   "total_payment"
    t.string   "receipt_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_time"
    t.string   "attachment"
  end

  create_table "profiles", force: true do |t|
    t.string   "nama_penuh"
    t.string   "tel_num"
    t.string   "facebook_id"
    t.string   "nama_waris"
    t.string   "hub_waris"
    t.string   "tel_num_waris"
    t.string   "nama_bank"
    t.string   "nama_akaun"
    t.string   "no_akaun"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "ic_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "postcode"
    t.string   "country"
    t.string   "ic_num_heir1"
    t.string   "heir1_address1"
    t.string   "heir1_address2"
    t.string   "heir1_city"
    t.string   "heir1_state"
    t.string   "heir1_postcode"
    t.string   "heir1_country"
    t.string   "heir1_email"
    t.string   "heir1_fb_id"
    t.string   "heir2_name"
    t.string   "heir2_rel"
    t.string   "heir2_phone_num"
    t.string   "ic_num_heir2"
    t.string   "heir2_address1"
    t.string   "heir2_address2"
    t.string   "heir2_city"
    t.string   "heir2_state"
    t.string   "heir2_postcode"
    t.string   "heir2_country"
    t.string   "heir2_email"
    t.string   "heir2_fb_id"
  end

  create_table "statuses", force: true do |t|
    t.string   "status_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login",                                  null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "slug"
    t.datetime "deleted_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vouchers", force: true do |t|
    t.integer  "user_id",        null: false
    t.integer  "order_id",       null: false
    t.string   "voucher_date"
    t.string   "method"
    t.string   "status"
    t.string   "total_payment"
    t.string   "receipt_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
