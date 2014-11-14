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

ActiveRecord::Schema.define(version: 20141114013227) do

  create_table "steward_kpis", force: true do |t|
    t.text     "code"
    t.string   "resource"
    t.integer  "code_type"
    t.integer  "query_plan"
    t.integer  "position"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "node_type"
    t.text     "labels"
  end

  add_index "steward_kpis", ["ancestry"], name: "index_steward_kpis_on_ancestry"

  create_table "steward_page_widgets", force: true do |t|
    t.integer  "widget_type"
    t.string   "label"
    t.text     "options"
    t.integer  "steward_kpi_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steward_page_widgets", ["steward_kpi_id"], name: "index_steward_page_widgets_on_steward_kpi_id"

end
