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

ActiveRecord::Schema.define(version: 20150623011018) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "scan_types", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "command",            null: false
    t.integer  "service_type_id"
    t.integer  "service_version_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "scans", force: :cascade do |t|
    t.integer  "scan_type_id",                     null: false
    t.integer  "target_id",                        null: false
    t.integer  "service_id"
    t.datetime "date",                             null: false
    t.text     "output"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "state",        default: "pending"
  end

  create_table "servers", force: :cascade do |t|
    t.string   "os"
    t.string   "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers_targets", force: :cascade do |t|
    t.integer  "server_id"
    t.integer  "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "servers_targets", ["server_id"], name: "index_servers_targets_on_server_id"
  add_index "servers_targets", ["target_id"], name: "index_servers_targets_on_target_id"

  create_table "service_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_versions", force: :cascade do |t|
    t.string   "version",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer  "target_id"
    t.string   "protocol"
    t.integer  "port"
    t.string   "path"
    t.integer  "service_type_id"
    t.integer  "serice_version_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "services", ["serice_version_id"], name: "index_services_on_serice_version_id"
  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id"
  add_index "services", ["target_id"], name: "index_services_on_target_id"

  create_table "targets", force: :cascade do |t|
    t.string   "domain",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "targets", ["domain"], name: "index_targets_on_domain"

end
