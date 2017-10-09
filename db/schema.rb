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

ActiveRecord::Schema.define(version: 20171009041718) do

  create_table "addresses", force: :cascade do |t|
    t.string   "state"
    t.string   "city"
    t.string   "zipcode"
    t.string   "street"
    t.string   "neighborhood"
    t.integer  "number"
    t.integer  "customer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "buys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.decimal  "value_input"
    t.decimal  "value_out"
    t.integer  "currency_input_id"
    t.integer  "currency_out_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "buys", ["currency_input_id"], name: "index_buys_on_currency_input_id"
  add_index "buys", ["currency_out_id"], name: "index_buys_on_currency_out_id"
  add_index "buys", ["customer_id"], name: "index_buys_on_customer_id"
  add_index "buys", ["user_id"], name: "index_buys_on_user_id"

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "price",      precision: 6, scale: 6
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.integer  "sex",        default: 0
    t.date     "birth"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sells", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.decimal  "value_input"
    t.decimal  "value_out"
    t.integer  "currency_input_id"
    t.integer  "currency_out_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sells", ["currency_input_id"], name: "index_sells_on_currency_input_id"
  add_index "sells", ["currency_out_id"], name: "index_sells_on_currency_out_id"
  add_index "sells", ["customer_id"], name: "index_sells_on_customer_id"
  add_index "sells", ["user_id"], name: "index_sells_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "cpf"
    t.integer  "sex",                    default: 0
    t.boolean  "role"
    t.date     "birth"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "kind"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "google"
    t.string   "rmk"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
