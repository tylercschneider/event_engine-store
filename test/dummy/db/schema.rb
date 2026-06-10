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

ActiveRecord::Schema[8.1].define(version: 2026_06_05_000001) do
  create_table "event_engine_store_stored_events", force: :cascade do |t|
    t.string "aggregate_id"
    t.string "aggregate_type"
    t.integer "aggregate_version"
    t.datetime "created_at", null: false
    t.string "event_name", null: false
    t.string "event_type"
    t.integer "event_version"
    t.string "idempotency_key"
    t.json "metadata"
    t.datetime "occurred_at"
    t.json "payload"
    t.string "process_type"
    t.index ["event_name"], name: "index_event_engine_store_stored_events_on_event_name"
    t.index ["idempotency_key"], name: "index_event_engine_store_stored_events_on_idempotency_key"
    t.index ["occurred_at"], name: "index_event_engine_store_stored_events_on_occurred_at"
  end
end
