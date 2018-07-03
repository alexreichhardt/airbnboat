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

ActiveRecord::Schema.define(version: 2018_07_03_104000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "name"
    t.integer "person_capacity"
    t.integer "year"
    t.integer "length"
    t.string "fuel_type"
    t.string "model"
    t.string "horse_power"
    t.integer "sleeps"
    t.integer "fuel_capacity"
    t.string "required_license"
    t.integer "price"
    t.date "start_date"
    t.date "end_date"
    t.string "city"
    t.string "street"
    t.string "location_details"
    t.string "zipcode"
    t.string "country"
    t.string "engine"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boats_on_user_id"
  end

  create_table "booking_reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_reviews_on_booking_id"
    t.index ["user_id"], name: "index_booking_reviews_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "boat_id"
    t.date "start_date"
    t.date "end_date"
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_bookings_on_boat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_user_reviews_on_booking_id"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boats", "users"
  add_foreign_key "booking_reviews", "bookings"
  add_foreign_key "booking_reviews", "users"
  add_foreign_key "bookings", "boats"
  add_foreign_key "bookings", "users"
  add_foreign_key "user_reviews", "bookings"
  add_foreign_key "user_reviews", "users"
end
