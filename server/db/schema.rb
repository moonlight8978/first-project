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

ActiveRecord::Schema.define(version: 20170530130622) do

  create_table "bussiness_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "type_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_bussiness_products_on_type_id"
  end

  create_table "bussiness_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "original_name", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "security_activate_account_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.string "token", null: false
    t.datetime "expiration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_security_activate_account_tokens_on_user_id"
  end

  create_table "security_invalid_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token", null: false
    t.datetime "expiration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "security_reset_password_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.string "token", null: false
    t.datetime "expiration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_security_reset_password_tokens_on_user_id"
  end

  create_table "security_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "security_roles_security_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "role_id"], name: "index_security_roles_security_users_on_user_id_and_role_id"
  end

  create_table "security_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_name", null: false
    t.string "password_digest", null: false
    t.string "email", null: false
    t.string "phone_number"
    t.string "address"
    t.boolean "activated", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "profile_image_url"
    t.date "birthday"
    t.text "about"
    t.string "signature"
    t.bigint "country_id"
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "gmail_url"
    t.datetime "password_updated_at", default: "2017-05-30 21:32:14", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_security_users_on_country_id"
    t.index ["email"], name: "index_security_users_on_email"
    t.index ["user_name"], name: "index_security_users_on_user_name"
  end

  create_table "vndb_characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id", null: false
    t.string "name", null: false
    t.string "original_name", null: false
    t.integer "birthday_day"
    t.integer "birthday_month"
    t.string "gender", null: false
    t.integer "weight"
    t.integer "height"
    t.integer "bust"
    t.integer "waist"
    t.integer "hip"
    t.string "blood_type"
    t.string "image"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_vndb_characters_on_novel_id"
  end

  create_table "vndb_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "original_name", null: false
    t.bigint "country_id", null: false
    t.string "link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_vndb_companies_on_country_id"
  end

  create_table "vndb_developers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id", null: false
    t.bigint "release_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_vndb_developers_on_company_id"
    t.index ["release_id"], name: "index_vndb_developers_on_release_id"
  end

  create_table "vndb_novels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "title"
    t.string "original_title", null: false
    t.string "aliases"
    t.integer "length", null: false
    t.text "description"
    t.text "original_description"
    t.string "image", null: false
    t.boolean "image_nsfw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_vndb_novels_on_product_id"
  end

  create_table "vndb_novels_vndb_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id", null: false
    t.bigint "tag_id", null: false
    t.index ["novel_id", "tag_id"], name: "index_vndb_novels_vndb_tags_on_novel_id_and_tag_id"
  end

  create_table "vndb_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "country_id"
    t.string "name"
    t.string "original_name"
    t.string "birthday"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_vndb_people_on_country_id"
  end

  create_table "vndb_publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id", null: false
    t.bigint "release_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_vndb_publishers_on_company_id"
    t.index ["release_id"], name: "index_vndb_publishers_on_release_id"
  end

  create_table "vndb_releases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id", null: false
    t.integer "voiced"
    t.integer "animation_story"
    t.integer "animation_ero"
    t.date "released", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_vndb_releases_on_novel_id"
  end

  create_table "vndb_staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id", null: false
    t.bigint "novel_id", null: false
    t.string "position", default: "Staff", null: false
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_vndb_staffs_on_novel_id"
    t.index ["person_id"], name: "index_vndb_staffs_on_person_id"
  end

  create_table "vndb_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "index_vndb_tags_on_tag"
  end

  create_table "vndb_voice_actresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id", null: false
    t.bigint "character_id", null: false
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_vndb_voice_actresses_on_character_id"
    t.index ["person_id"], name: "index_vndb_voice_actresses_on_person_id"
  end

end
