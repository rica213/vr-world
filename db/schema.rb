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

ActiveRecord::Schema[7.0].define(version: 2023_06_22_095255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.date "reservation_date"
    t.string "location"
    t.bigint "studio_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_reservations_on_studio_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "duration"
    t.string "location"
    t.string "working_hours"
    t.string "image_url"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "studios"
  add_foreign_key "reservations", "users"
  add_foreign_key "studios", "users"
end
