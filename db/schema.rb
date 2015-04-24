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

ActiveRecord::Schema.define(version: 20150417061305) do

  create_table "addresses", force: true do |t|
    t.integer  "parent_id"
    t.string   "street"
    t.string   "apt"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["parent_id"], name: "index_addresses_on_parent_id", using: :btree

  create_table "allergics", force: true do |t|
    t.integer  "kid_id"
    t.integer  "allergy_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allergics", ["allergy_id"], name: "index_allergics_on_allergy_id", using: :btree
  add_index "allergics", ["kid_id"], name: "index_allergics_on_kid_id", using: :btree

  create_table "allergies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "medicine"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", force: true do |t|
    t.integer  "kid_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["kid_id"], name: "index_attendances_on_kid_id", using: :btree

  create_table "families", force: true do |t|
    t.integer  "kid_id"
    t.integer  "parent_id"
    t.boolean  "is_primary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "families", ["kid_id"], name: "index_families_on_kid_id", using: :btree
  add_index "families", ["parent_id"], name: "index_families_on_parent_id", using: :btree

  create_table "kids", force: true do |t|
    t.string   "f_name"
    t.string   "m_name"
    t.string   "l_name"
    t.string   "guid"
    t.datetime "dob"
    t.datetime "first_date_attended"
    t.boolean  "is_checked_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender",              default: 0
    t.integer  "group",               default: 0
  end

  create_table "parents", force: true do |t|
    t.string   "f_name"
    t.string   "m_name"
    t.string   "l_name"
    t.string   "guid"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_books", force: true do |t|
    t.integer  "parent_id"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_books", ["parent_id"], name: "index_phone_books_on_parent_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
