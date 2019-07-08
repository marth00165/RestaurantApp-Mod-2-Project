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

ActiveRecord::Schema.define(version: 2019_07_08_235029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "card_no"
    t.integer "sec_code"
    t.integer "pin"
    t.integer "user_id"
  end

  create_table "drink_orders", force: :cascade do |t|
    t.integer "drink_id"
    t.integer "order_id"
    t.string "size"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "imgurl"
    t.string "desc"
  end

  create_table "food_orders", force: :cascade do |t|
    t.integer "food_id"
    t.integer "order_id"
    t.integer "spicy"
    t.integer "quantity"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "imgurl"
    t.string "desc"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "complete"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.integer "age"
    t.string "address"
    t.string "password"
  end

end
