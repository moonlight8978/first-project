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

ActiveRecord::Schema.define(version: 20170516121034) do

  create_table "authorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_authorities_on_role_id", using: :btree
    t.index ["user_id"], name: "index_authorities_on_user_id", using: :btree
  end

  create_table "invalid_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "token",      null: false
    t.datetime "expiration", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_name",                                                            null: false
    t.string   "password_digest",                                                      null: false
    t.string   "email",                                                                null: false
    t.string   "phone_number"
    t.string   "address"
    t.boolean  "activated",                            default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_image_url"
    t.date     "birthday"
    t.text     "about",                  limit: 65535
    t.string   "signature"
    t.string   "country"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "gmail_url"
    t.string   "reset_password_token"
    t.string   "forget_password_token"
    t.string   "activate_account_token"
    t.datetime "password_updated_at",                  default: '2017-05-20 14:55:44', null: false
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

end
