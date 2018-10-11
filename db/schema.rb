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

ActiveRecord::Schema.define(version: 2018_10_05_030835) do

  create_table "activities", force: :cascade do |t|
    t.integer "member_id"
    t.string "location"
    t.string "category"
    t.text "intro"
    t.text "overview"
    t.string "address01"
    t.string "address02"
    t.string "zipcode"
    t.integer "legal_requirement"
    t.text "host_arrangement"
    t.text "participant_preparation"
    t.text "notes"
    t.integer "price"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.boolean "alcohol_served", default: false
    t.integer "minimum_age"
    t.integer "how_active"
    t.text "additional_requirement"
    t.boolean "id_required", default: false
    t.integer "group_size"
    t.integer "total_time"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.integer "role", default: 0
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

end
