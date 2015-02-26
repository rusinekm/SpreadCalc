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

ActiveRecord::Schema.define(version: 20150222230519) do

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.decimal  "average_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currency_sites", force: true do |t|
    t.integer  "currency_id"
    t.integer  "site_id"
    t.string   "buy_parsing_class"
    t.string   "sell_parsing_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency_class"
    t.string   "string"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stat_nodes", force: true do |t|
    t.decimal  "sell_value"
    t.decimal  "buy_value"
    t.decimal  "spread_value"
    t.decimal  "net_worth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "currency_id"
    t.integer  "site_id"
  end

end
