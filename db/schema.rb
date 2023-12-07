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

ActiveRecord::Schema[7.0].define(version: 2023_12_07_040035) do
  create_table "adresses", force: :cascade do |t|
    t.string "street_name"
    t.integer "number"
    t.string "neighborhood"
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_adresses_on_customer_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone_number"
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_contacts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "description"
    t.string "tag"
    t.integer "device_category_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_devices_on_customer_id"
    t.index ["device_category_id"], name: "index_devices_on_device_category_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.string "description"
    t.text "details"
    t.string "start_date", limit: 8
    t.string "end_date", limit: 8
    t.integer "status"
    t.integer "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_service_orders_on_device_id"
  end

  add_foreign_key "adresses", "customers"
  add_foreign_key "contacts", "customers"
  add_foreign_key "devices", "customers"
  add_foreign_key "devices", "device_categories"
  add_foreign_key "service_orders", "devices"
end
