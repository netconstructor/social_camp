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

ActiveRecord::Schema.define(:version => 20120427135054) do

  create_table "action_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "changelogs", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "user_id"
    t.integer  "action_type_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "destroyed_content_summary"
  end

  add_index "changelogs", ["trackable_id"], :name => "index_changelogs_on_trackable_id"
  add_index "changelogs", ["trackable_type"], :name => "index_changelogs_on_trackable_type"
  add_index "changelogs", ["user_id"], :name => "index_changelogs_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "discussion_id"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comments", ["discussion_id"], :name => "index_comments_on_discussion_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "discussions", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "discussions", ["user_id"], :name => "index_discussions_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.datetime "start_at"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["start_at"], :name => "index_events_on_start_at"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
