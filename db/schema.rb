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

ActiveRecord::Schema.define(version: 20141008130919) do

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

  create_table "inbox_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "inbox_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "inbox_anc_desc_udx", unique: true, using: :btree
  add_index "inbox_hierarchies", ["descendant_id"], name: "inbox_desc_idx", using: :btree

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
    t.integer  "parent_id"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "package_id",    null: false
    t.integer  "discount_id",   null: false
    t.integer  "status_id",     null: false
    t.string   "gram_quantity"
    t.string   "price"
    t.string   "total_price"
    t.string   "ref_number"
    t.datetime "ordered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "packages", force: true do |t|
    t.string   "package_name"
    t.string   "selling_price"
    t.string   "buying_price"
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
  end

  create_table "statuses", force: true do |t|
    t.string   "status_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login",                               null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
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
