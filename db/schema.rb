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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140915124424) do
=======
ActiveRecord::Schema.define(version: 20140912133837) do
>>>>>>> 2476a5bf013809e5ca1b04f509f92ee3bc57a2b6

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "screen_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "oauth_token"
    t.text     "oauth_secret"
    t.integer  "user_id"
  end

  create_table "whitelists", force: true do |t|
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "whitelist_user_id"
  end

end
