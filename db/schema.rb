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

ActiveRecord::Schema[7.1].define(version: 2023_05_18_135052) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hystories", force: :cascade do |t|
    t.string "operation_type"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.index ["person_id"], name: "index_hystories_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "kent@herzog.example", null: false
    t.string "nickname", default: "jone_kerluke", null: false
    t.index ["nickname"], name: "index_people_on_nickname", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.bigint "person_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_posts_on_person_id"
  end

  add_foreign_key "hystories", "people"
  add_foreign_key "posts", "people"
end
