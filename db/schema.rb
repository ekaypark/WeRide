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

ActiveRecord::Schema.define(version: 2018_11_19_105501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.string "total_time"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "member_id"
    t.integer "status", default: 0
    t.datetime "paid_out_at"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "confirmed_reservation_ids", default: [], array: true
  end

  create_table "invoices_reservations", id: false, force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "invoice_id"
    t.index ["invoice_id"], name: "index_invoices_reservations_on_invoice_id"
    t.index ["reservation_id"], name: "index_invoices_reservations_on_reservation_id"
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

  create_table "payout_infos", force: :cascade do |t|
    t.string "bank_name"
    t.string "account_holder_name"
    t.bigint "account_number"
    t.integer "member_id"
    t.boolean "default_use", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "member_id"
    t.integer "schedule_id"
    t.integer "participant_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.datetime "confirmed_at"
    t.datetime "cancel_requested_at"
    t.datetime "cancel_verdict_at"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "member_id"
    t.integer "activity_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
