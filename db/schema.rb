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

ActiveRecord::Schema.define(version: 20160926150100) do

  create_table "apis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "final_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "PoisId"
    t.integer  "user_id"
  end

  create_table "is_favourites", force: :cascade do |t|
    t.string   "userMail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "PoisId"
  end

  create_table "is_recents", force: :cascade do |t|
    t.string   "userMail"
    t.integer  "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "PoisId1"
    t.integer  "PoisId2"
    t.integer  "PoisId3"
    t.integer  "PoisId4"
    t.integer  "PoisId5"
  end

  create_table "pois", force: :cascade do |t|
    t.string   "name"
    t.string   "types"
    t.string   "address"
    t.float    "rate"
    t.integer  "price"
    t.string   "map"
    t.text     "image"
    t.text     "review"
    t.string   "api"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "apiId"
    t.float    "lat"
    t.float    "long"
    t.integer  "cap"
    t.integer  "voltePreferito"
    t.string   "website"
    t.string   "phone"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "text"
    t.text     "options"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "string_id"
    t.text     "time_condition"
    t.text     "required_place_types"
    t.text     "additional_place_types"
    t.text     "place_types_to_keep"
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

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
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
