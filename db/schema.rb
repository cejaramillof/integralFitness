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

ActiveRecord::Schema.define(version: 2019_04_11_030718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.integer "codice"
    t.string "descrizione"
    t.string "immagine"
    t.string "nomeimmagine"
    t.integer "gruppo1"
    t.integer "gruppo2"
    t.integer "accesso"
    t.integer "livello"
    t.string "fotoGA"
    t.string "fotoGB"
    t.string "fotoA"
    t.string "fotoB"
    t.string "mappa"
    t.string "mappe"
    t.string "video"
    t.integer "codicegruppo1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "group"
    t.string "carbohydrates"
    t.string "proteins"
    t.string "fats"
    t.boolean "default"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "cc"
    t.string "email"
    t.string "name"
    t.string "phone"
    t.boolean "gender"
    t.integer "height"
    t.date "dob"
    t.date "next"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "guest_id"
    t.float "weight"
    t.float "fat"
    t.integer "activity"
    t.integer "goal"
    t.float "muscle_mass"
    t.float "fat_mass"
    t.float "skeletal_mass"
    t.float "residual_mass"
    t.float "lean_mass"
    t.integer "kcal"
    t.integer "proteins"
    t.integer "carbs"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_plans_on_guest_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "premium"
    t.boolean "admin", default: false
    t.string "name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "foods", "users"
  add_foreign_key "guests", "users"
  add_foreign_key "plans", "guests"
  add_foreign_key "plans", "users"
end
