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

ActiveRecord::Schema.define(version: 20140623234502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  add_index "admins", ["approved"], name: "index_admins_on_approved", using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "citations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galaxies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "galaxy_name"
    t.string   "galaxy_type",   null: false
    t.float    "distance",      null: false
    t.float    "luminosity",    null: false
    t.float    "scale_length",  null: false
    t.float    "mass_hydrogen", null: false
    t.float    "mass_disk",     null: false
    t.float    "stars",         null: false
    t.float    "vcr",           null: false
    t.float    "n",             null: false
    t.float    "r0",            null: false
    t.float    "n_g",           null: false
    t.float    "r_0",           null: false
    t.float    "sigma0",        null: false
  end

  create_table "measurements", force: true do |t|
    t.float    "r",                 null: false
    t.float    "r_err_min",         null: false
    t.float    "r_err_max",         null: false
    t.float    "vrot_data",         null: false
    t.float    "vrot_data_err_min", null: false
    t.float    "vrot_data_err_max", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "galaxy_id"
  end

  add_index "measurements", ["galaxy_id"], name: "index_measurements_on_galaxy_id", using: :btree

end
