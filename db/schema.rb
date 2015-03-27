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

ActiveRecord::Schema.define(version: 20150314230543) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.integer  "user_id"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zip"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "updated_by", default: 1,    null: false
    t.integer  "country_id", default: 1,    null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "password"
    t.integer  "user_id"
    t.datetime "event_date"
    t.boolean  "set_password"
    t.integer  "chapter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "president_id"
    t.string   "headquarters"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "updated_by",   default: 1,    null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "county"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "convention_events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "event_time"
    t.string   "period"
    t.string   "location"
    t.integer  "year"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "updated_by",  default: 1, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code2"
    t.string   "code3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "expires_at"
    t.boolean  "active"
    t.integer  "chapter_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "updated_by", default: 1, null: false
  end

  create_table "payment_purposes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "purpose_id",              null: false
    t.integer  "fiscal_year"
    t.integer  "user_id",                 null: false
    t.integer  "referer_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "updated_by",  default: 1, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "file_path"
    t.string   "image_size"
    t.integer  "album_id"
    t.boolean  "notify"
    t.boolean  "main_photo"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "updated_by", default: 1,    null: false
    t.boolean  "active",     default: true, null: false
    t.string   "image"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "event_date"
    t.string   "image"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "updated_by",  default: 1, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                                             null: false
    t.string   "email",                                                null: false
    t.string   "password"
    t.string   "encrypted_password"
    t.string   "first_name",                                           null: false
    t.string   "last_name_now",                                        null: false
    t.string   "middle_name"
    t.integer  "class_year"
    t.integer  "role_id"
    t.integer  "chapter_id"
    t.string   "gender",                                               null: false
    t.string   "phone"
    t.text     "profession"
    t.boolean  "active",                 default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "full_time_student",      default: false,               null: false
    t.string   "last_name_pss",          default: "Current Last Name"
    t.integer  "updated_by",             default: 1,                   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "zips", force: :cascade do |t|
    t.integer  "code"
    t.integer  "state_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
