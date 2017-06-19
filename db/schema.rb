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

ActiveRecord::Schema.define(version: 20170619142256) do

  create_table "insured_items", force: :cascade do |t|
    t.string "description"
    t.string "serial"
    t.decimal "covered_value", precision: 2
    t.date "added_to_policy"
    t.integer "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policy_id"], name: "index_insured_items_on_policy_id"
  end

  create_table "policies", force: :cascade do |t|
    t.integer "number"
    t.integer "provider_id"
    t.string "category"
    t.string "alias"
    t.string "client_name"
    t.string "client_email"
    t.integer "account"
    t.date "in_force"
    t.date "last_change"
    t.date "last_renew"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["provider_id"], name: "index_policies_on_provider_id"
    t.index ["user_id"], name: "index_policies_on_user_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "CreateProviders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
