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

ActiveRecord::Schema.define(version: 20140805012611) do

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
    t.boolean  "super_user"
  end

  add_index "admins", ["approved"], name: "index_admins_on_approved"
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "citations", force: true do |t|
    t.text     "author",     null: false
    t.string   "title"
    t.text     "bibtex",     null: false
    t.string   "journal",    null: false
    t.integer  "year",       null: false
    t.integer  "volume"
    t.integer  "number"
    t.integer  "pages"
    t.string   "month"
    t.string   "note"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galaxies", force: true do |t|
    t.string   "galaxy_name",            null: false
    t.string   "galaxy_type",            null: false
    t.float    "distance",               null: false
    t.float    "luminosity",             null: false
    t.float    "scale_length",           null: false
    t.float    "mass_hydrogen",          null: false
    t.float    "mass_disk",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "velocities_citation"
    t.integer  "luminosity_citation"
    t.integer  "scale_length_citation"
    t.integer  "mass_hydrogen_citation"
  end

  create_table "galaxy_citations", force: true do |t|
    t.integer  "galaxy_id"
    t.integer  "citation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "velocities", force: true do |t|
    t.float    "r",               null: false
    t.float    "vrot_data",       null: false
    t.integer  "galaxy_id",       null: false
    t.float    "vrot_data_error", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "velocities", ["galaxy_id"], name: "index_velocities_on_galaxy_id"

end
