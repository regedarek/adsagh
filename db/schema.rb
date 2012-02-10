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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120210003446) do

  create_table "admins", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "advertiser_id"
    t.text     "ad_content"
    t.string   "token"
    t.date     "verification_date"
    t.integer  "level"
    t.integer  "category_id"
    t.integer  "admin_id"
    t.decimal  "price"
    t.integer  "display_counter",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "from"
    t.string   "to"
  end

  create_table "advertisers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "photos", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "ad_id"
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "category_id"
    t.decimal  "min_price"
    t.decimal  "max_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
