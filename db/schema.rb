# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140121193626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cubes", force: true do |t|
    t.string   "serial"
    t.string   "firmware"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "cube_id"
    t.string   "serial"
    t.string   "name"
    t.integer  "room_id"
    t.string   "firmware"
    t.string   "type"
    t.string   "radio_state"
    t.string   "battery_low"
    t.string   "transmit_error"
    t.decimal  "temperature"
    t.string   "valve_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", force: true do |t|
    t.integer  "room_id"
    t.decimal  "measured_temp"
    t.decimal  "setpoint_temp"
    t.string   "mode"
    t.string   "temp_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.integer  "cube_id"
    t.integer  "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
