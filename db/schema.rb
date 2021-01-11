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

ActiveRecord::Schema.define(version: 20201021071128) do

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.integer "price"
    t.string "image"
    t.string "state"
    t.string "region"
    t.integer "saler_id"
    t.integer "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shipping_date"
    t.string "shipping_method"
    t.string "shipping_charge"
    t.datetime "buyed_or_sold_time"
    t.string "which_sold_item"
    t.string "tradind"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "comment_id"
    t.string "action"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.text "text"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "first_reading"
    t.string "last_reading"
    t.integer "postal_code"
    t.string "prefecture"
    t.string "municipality"
    t.string "address"
    t.string "building_name"
    t.integer "phone_number"
    t.string "real_name"
    t.string "real_reading"
    t.string "birthday"
    t.integer "real_postal_code"
    t.string "real_prefecture"
    t.string "real_municipality"
    t.string "real_address"
    t.string "real_building_name"
  end

end
