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

ActiveRecord::Schema.define(version: 20140729075643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "location_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zip_code"
    t.string   "street"
    t.string   "country"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "pwd"
    t.string   "email"
  end

  create_table "visits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.string   "user_name"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "user_id"
  end

end
