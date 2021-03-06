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

ActiveRecord::Schema.define(version: 20160523223002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "desc",       default: "This Board has no Description"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.text     "body"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "pos_votes",   default: 0
    t.integer  "neg_votes",   default: 0
    t.integer  "total_votes", default: 0
    t.integer  "net_votes",   default: 0
  end

  create_table "links", force: :cascade do |t|
    t.string   "title",                       null: false
    t.string   "url",                         null: false
    t.integer  "user_id",                     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "comment_counter", default: 0
    t.integer  "pos_votes",       default: 0
    t.integer  "neg_votes",       default: 0
    t.integer  "total_votes",     default: 0
    t.integer  "net_votes",       default: 0
    t.integer  "board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       null: false
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "votable_id"
    t.string   "votable_type"
  end

end
