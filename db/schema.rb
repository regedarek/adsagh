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

ActiveRecord::Schema.define(:version => 20111212194516) do

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "email_id"
    t.text     "ad_content"
    t.string   "token"
    t.date     "verification_date"
    t.integer  "category_id"
    t.decimal  "price",             :precision => 6, :scale => 2
    t.integer  "display_counter",                                 :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
