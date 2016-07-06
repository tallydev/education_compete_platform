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

ActiveRecord::Schema.define(version: 20160706073347) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "status",     limit: 4,   default: 0
    t.string   "type",       limit: 255
  end

  create_table "bulletins", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.integer  "activity_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "bulletins", ["activity_id"], name: "index_bulletins_on_activity_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "school_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "departments", ["school_id"], name: "index_departments_on_school_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "type",              limit: 255
    t.string   "photo_type",        limit: 255
    t.integer  "imageable_id",      limit: 4
    t.string   "imageable_type",    limit: 255
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "info_competition_recruits", force: :cascade do |t|
    t.integer  "player_id",   limit: 4
    t.integer  "school_id",   limit: 4
    t.integer  "activity_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "info_competition_recruits", ["activity_id"], name: "index_info_competition_recruits_on_activity_id", using: :btree
  add_index "info_competition_recruits", ["player_id"], name: "index_info_competition_recruits_on_player_id", using: :btree
  add_index "info_competition_recruits", ["school_id"], name: "index_info_competition_recruits_on_school_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.float    "score",      limit: 24
    t.integer  "recruit_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "marks", ["recruit_id"], name: "index_marks_on_recruit_id", using: :btree

  create_table "media", force: :cascade do |t|
    t.string   "type",              limit: 255
    t.string   "media_type",        limit: 255
    t.integer  "mediaable_id",      limit: 4
    t.string   "mediaable_type",    limit: 255
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "media", ["mediaable_type", "mediaable_id"], name: "index_media_on_mediaable_type_and_mediaable_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "content",     limit: 65535
    t.integer  "activity_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "summary",     limit: 65535
  end

  add_index "news", ["activity_id"], name: "index_news_on_activity_id", using: :btree

  create_table "opus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "type",              limit: 255
    t.string   "paper_type",        limit: 255
    t.integer  "paperable_id",      limit: 4
    t.string   "paperable_type",    limit: 255
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "papers", ["paperable_type", "paperable_id"], name: "index_papers_on_paperable_type_and_paperable_id", using: :btree

  create_table "player_infos", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "card_number", limit: 255
    t.string   "address",     limit: 255
    t.string   "code",        limit: 255
    t.integer  "sex",         limit: 4
    t.string   "nation",      limit: 255
    t.integer  "player_id",   limit: 4
    t.integer  "school_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "player_infos", ["player_id"], name: "index_player_infos_on_player_id", using: :btree
  add_index "player_infos", ["school_id"], name: "index_player_infos_on_school_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "phone",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "school_id",              limit: 4
  end

  add_index "players", ["phone"], name: "index_players_on_phone", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  add_index "players", ["school_id"], name: "index_players_on_school_id", using: :btree

  create_table "recruits", force: :cascade do |t|
    t.integer  "activities_id", limit: 4
    t.integer  "player_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "recruits", ["activities_id"], name: "index_recruits_on_activities_id", using: :btree
  add_index "recruits", ["player_id"], name: "index_recruits_on_player_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "talk_competition_recruits", force: :cascade do |t|
    t.integer  "player_id",   limit: 4
    t.integer  "school_id",   limit: 4
    t.integer  "activity_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "talk_competition_recruits", ["activity_id"], name: "index_talk_competition_recruits_on_activity_id", using: :btree
  add_index "talk_competition_recruits", ["player_id"], name: "index_talk_competition_recruits_on_player_id", using: :btree
  add_index "talk_competition_recruits", ["school_id"], name: "index_talk_competition_recruits_on_school_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "mark_id",    limit: 4
    t.integer  "expert_id",  limit: 4
    t.integer  "recruit_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tasks", ["expert_id"], name: "index_tasks_on_expert_id", using: :btree
  add_index "tasks", ["mark_id"], name: "index_tasks_on_mark_id", using: :btree
  add_index "tasks", ["recruit_id"], name: "index_tasks_on_recruit_id", using: :btree

  create_table "user_infos", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.integer  "id_card_type", limit: 4
    t.string   "id_card",      limit: 255
    t.string   "nation",       limit: 255
    t.string   "gender",       limit: 255
    t.string   "tel",          limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",      limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "email",                  limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "school_id",              limit: 4
    t.string   "type",                   limit: 255
  end

  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

  add_foreign_key "info_competition_recruits", "activities"
  add_foreign_key "info_competition_recruits", "players"
  add_foreign_key "info_competition_recruits", "schools"
  add_foreign_key "player_infos", "players"
  add_foreign_key "player_infos", "schools"
  add_foreign_key "players", "schools"
  add_foreign_key "talk_competition_recruits", "activities"
  add_foreign_key "talk_competition_recruits", "players"
  add_foreign_key "talk_competition_recruits", "schools"
end
