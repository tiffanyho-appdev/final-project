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

ActiveRecord::Schema.define(version: 20181213040453) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "days", force: :cascade do |t|
    t.integer "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_in_itinerary"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_name"
    t.string "hotel_address"
    t.float "hotel_rating"
    t.string "hotel_link"
    t.string "hotel_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer "user_id"
    t.string "name_of_trip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "days_in_trip"
    t.string "location_of_trip"
  end

  create_table "places", force: :cascade do |t|
    t.string "place_name"
    t.string "place_address"
    t.string "place_description"
    t.float "place_rating"
    t.string "place_link"
    t.string "place_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planned_funs", force: :cascade do |t|
    t.string "place_id"
    t.integer "day_id"
    t.string "order_in_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "itinerary_id"
  end

  create_table "planned_meals", force: :cascade do |t|
    t.string "rest_id"
    t.integer "day_id"
    t.string "order_in_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "itinerary_id"
  end

  create_table "planned_stays", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "day_id"
    t.integer "order_in_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "itinerary_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "rest_name"
    t.string "rest_address"
    t.string "rest_genre"
    t.float "rest_rating"
    t.string "rest_link"
    t.string "rest_pic"
    t.string "rest_menu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
