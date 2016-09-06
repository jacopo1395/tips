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

ActiveRecord::Schema.define(version: 20160906163912) do

  create_table "final_results", force: :cascade do |t|
    t.string   "userMail"
    t.integer  "searchNumber"
    t.string   "apiId"
    t.string   "api"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "is_favourites", force: :cascade do |t|
    t.string   "userMail"
    t.string   "apiId"
    t.string   "api"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "is_recents", force: :cascade do |t|
    t.string   "userMail"
    t.string   "apiId1"
    t.string   "api1"
    t.string   "apiId2"
    t.string   "api2"
    t.string   "apiId3"
    t.string   "api3"
    t.string   "apiId4"
    t.string   "api4"
    t.string   "apiId5"
    t.string   "api5"
    t.integer  "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pois", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "address"
    t.integer  "rate"
    t.integer  "price"
    t.string   "map"
    t.string   "image"
    t.text     "review"
    t.string   "api"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "apiId"
    t.float    "lat"
    t.float    "long"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "text"
    t.text     "option"
    t.integer  "answer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "questionId"
    t.integer  "searchNumber"
    t.string   "userMail"
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "number"
    t.integer  "range"
    t.float    "lat"
    t.float    "long"
    t.string   "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
