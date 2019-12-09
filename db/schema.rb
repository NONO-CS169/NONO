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

ActiveRecord::Schema.define(version: 20191209040439) do

  create_table "reviews", force: :cascade do |t|
    t.integer  "votes"
    t.integer  "venue_id"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "included_audience_stars"
    t.text     "included_audience_text"
    t.integer  "programming_representation_stars"
    t.text     "programming_representation_text"
    t.integer  "food_representation_stars"
    t.text     "food_representation_text"
    t.integer  "personal_comfort_stars"
    t.text     "personal_comfort_text"
    t.integer  "staff_comfort_stars"
    t.text     "staff_comfort_text"
    t.integer  "cast_representation_stars"
    t.text     "cast_representation_text"
    t.integer  "whole_venue_stars"
    t.text     "whole_venue_text"
    t.integer  "show_overview_stars"
    t.text     "show_overview_text"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"
  add_index "reviews", ["venue_id"], name: "index_reviews_on_venue_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venues", force: :cascade do |t|
    t.string   "venue_name"
    t.string   "link"
    t.string   "location"
    t.string   "name"
    t.string   "county"
    t.string   "ptype"
    t.string   "jtype"
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
