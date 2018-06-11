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

ActiveRecord::Schema.define(version: 20180611022029) do

  create_table "restrictions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plate_number"
    t.integer "morning_schedule_id"
    t.integer "afternoon_schedule_id"
    t.integer "day_of_week"
    t.index ["afternoon_schedule_id"], name: "index_restrictions_on_afternoon_schedule_id"
    t.index ["morning_schedule_id"], name: "index_restrictions_on_morning_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "start"
    t.string "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
