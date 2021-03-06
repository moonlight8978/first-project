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

ActiveRecord::Schema.define(version: 20170624091308) do

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

  create_table "database_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "name_en"
    t.bigint "country_id", null: false
    t.string "link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_database_companies_on_country_id"
  end

  create_table "database_developers_vndb_developeds", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id", null: false
    t.bigint "release_id", null: false
    t.index ["company_id", "release_id"], name: "index_developeds_developers"
  end

  create_table "database_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "country_id"
    t.string "name", null: false
    t.string "name_en", null: false
    t.integer "gender"
    t.integer "birthday_day"
    t.integer "birthday_month"
    t.integer "birthday_year"
    t.string "link"
    t.string "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_database_people_on_country_id"
  end

  create_table "database_publishers_vndb_publisheds", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id", null: false
    t.bigint "release_id", null: false
    t.index ["company_id", "release_id"], name: "index_publisheds_publishers"
  end

  create_table "feature_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_feature_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_feature_comments_on_user_id"
  end

  create_table "feature_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.bigint "user_id"
    t.integer "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_feature_ratings_on_rateable_type_and_rateable_id"
    t.index ["user_id"], name: "index_feature_ratings_on_user_id"
  end

  create_table "general_countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "name_en", null: false
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
    t.string "middle_name"
    t.string "profile_image"
    t.date "birthday"
    t.text "about"
    t.string "signature"
    t.bigint "country_id"
    t.string "facebook"
    t.string "twitter"
    t.string "gmail"
    t.datetime "password_updated_at", default: "2017-06-24 19:04:14", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_security_users_on_country_id"
    t.index ["email"], name: "index_security_users_on_email"
    t.index ["user_name"], name: "index_security_users_on_user_name"
  end

  create_table "vgmdb_albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id"
    t.bigint "format_id"
    t.string "title", null: false
    t.string "title_en"
    t.string "code"
    t.date "released"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["format_id"], name: "index_vgmdb_albums_on_format_id"
    t.index ["novel_id"], name: "index_vgmdb_albums_on_novel_id"
  end

  create_table "vgmdb_albums_vgmdb_classifications", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "album_id", null: false
    t.bigint "classification_id", null: false
    t.index ["album_id", "classification_id"], name: "index_albums_classifications"
  end

  create_table "vgmdb_classifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type", null: false
    t.string "type_en", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vgmdb_discs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "album_id"
    t.integer "disc", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_vgmdb_discs_on_album_id"
  end

  create_table "vgmdb_formats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vgmdb_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "disc_id", null: false
    t.string "name", null: false
    t.string "name_en"
    t.integer "length_second", null: false
    t.integer "length_minute", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_vgmdb_songs_on_disc_id"
  end

  create_table "vgmdb_staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id", null: false
    t.bigint "song_id", null: false
    t.string "position", null: false
    t.string "alias"
    t.string "alias_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_vgmdb_staffs_on_person_id"
    t.index ["song_id"], name: "index_vgmdb_staffs_on_song_id"
  end

  create_table "vndb_characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.integer "birthday_day"
    t.integer "birthday_month"
    t.integer "gender", null: false
    t.integer "weight"
    t.integer "height"
    t.integer "bust"
    t.integer "waist"
    t.integer "hip"
    t.string "blood_type"
    t.string "image"
    t.integer "role"
    t.text "description"
    t.text "description_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vndb_novels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.string "title_en"
    t.integer "length", null: false
    t.text "description"
    t.text "description_en"
    t.string "image", null: false
    t.string "image_description"
    t.boolean "image_nsfw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vndb_novels_vndb_releases", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id", null: false
    t.bigint "release_id", null: false
    t.index ["novel_id", "release_id"], name: "index_novels_releases"
  end

  create_table "vndb_novels_vndb_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id", null: false
    t.bigint "tag_id", null: false
    t.index ["novel_id", "tag_id"], name: "index_vndb_novels_vndb_tags_on_novel_id_and_tag_id"
  end

  create_table "vndb_platforms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "platform", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vndb_releases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "platform_id", null: false
    t.string "title", null: false
    t.string "title_en"
    t.integer "status", null: false
    t.integer "voiced"
    t.integer "animation_story"
    t.integer "animation_ero"
    t.date "released", null: false
    t.integer "age_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_vndb_releases_on_platform_id"
    t.index ["status"], name: "index_vndb_releases_on_status"
  end

  create_table "vndb_screenshots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "novel_id"
    t.string "image", null: false
    t.boolean "image_nsfw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_vndb_screenshots_on_novel_id"
  end

  create_table "vndb_staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id", null: false
    t.bigint "novel_id", null: false
    t.string "position", default: "Staff", null: false
    t.string "note"
    t.string "alias"
    t.string "alias_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["novel_id"], name: "index_vndb_staffs_on_novel_id"
    t.index ["person_id"], name: "index_vndb_staffs_on_person_id"
  end

  create_table "vndb_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tag", null: false
    t.string "tag_en", null: false
    t.text "description"
    t.text "description_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "index_vndb_tags_on_tag"
    t.index ["tag_en"], name: "index_vndb_tags_on_tag_en"
  end

  create_table "vndb_voice_actresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_id", null: false
    t.bigint "novel_id", null: false
    t.bigint "person_id"
    t.string "alias"
    t.string "alias_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_vndb_voice_actresses_on_character_id"
    t.index ["novel_id"], name: "index_vndb_voice_actresses_on_novel_id"
    t.index ["person_id"], name: "index_vndb_voice_actresses_on_person_id"
  end

end
