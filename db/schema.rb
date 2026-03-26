# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_26_180351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "estates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "has_vacancy"
    t.bigint "landlord_profile_id", null: false
    t.string "location"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["landlord_profile_id"], name: "index_estates_on_landlord_profile_id"
  end

  create_table "house_bills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "electric_bill"
    t.bigint "house_id", null: false
    t.decimal "rent"
    t.datetime "updated_at", null: false
    t.decimal "water_bill"
    t.index ["house_id"], name: "index_house_bills_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "estate_id", null: false
    t.string "house_name"
    t.integer "house_type", default: 0, null: false
    t.boolean "is_occupied", default: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_houses_on_estate_id"
  end

  create_table "landlord_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_landlord_profiles_on_user_id"
  end

  create_table "leases", force: :cascade do |t|
    t.date "begin"
    t.datetime "created_at", null: false
    t.date "end"
    t.bigint "house_id", null: false
    t.bigint "tenant_profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_leases_on_house_id"
    t.index ["tenant_profile_id"], name: "index_leases_on_tenant_profile_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tenant_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tenant_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "password_digest", null: false
    t.string "phonenumber"
    t.integer "role", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "estates", "landlord_profiles"
  add_foreign_key "house_bills", "houses"
  add_foreign_key "houses", "estates"
  add_foreign_key "landlord_profiles", "users"
  add_foreign_key "leases", "houses"
  add_foreign_key "leases", "tenant_profiles"
  add_foreign_key "sessions", "users"
  add_foreign_key "tenant_profiles", "users"
end
