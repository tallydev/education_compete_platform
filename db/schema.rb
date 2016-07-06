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

ActiveRecord::Schema.define(version: 20160705161548) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",                   null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "bulletins", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bulletins", ["activity_id"], name: "index_bulletins_on_activity_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departments", ["school_id"], name: "index_departments_on_school_id"

  create_table "images", force: :cascade do |t|
    t.string   "type"
    t.string   "photo_type"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"

  create_table "marks", force: :cascade do |t|
    t.float    "score"
    t.integer  "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "marks", ["recruit_id"], name: "index_marks_on_recruit_id"

  create_table "media", force: :cascade do |t|
    t.string   "type"
    t.string   "media_type"
    t.integer  "mediaable_id"
    t.string   "mediaable_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "media", ["mediaable_type", "mediaable_id"], name: "index_media_on_mediaable_type_and_mediaable_id"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "summary"
  end

  add_index "news", ["activity_id"], name: "index_news_on_activity_id"

  create_table "opus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "type"
    t.string   "paper_type"
    t.integer  "paperable_id"
    t.string   "paperable_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "papers", ["paperable_type", "paperable_id"], name: "index_papers_on_paperable_type_and_paperable_id"

  create_table "players", force: :cascade do |t|
    t.string   "phone",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "players", ["phone"], name: "index_players_on_phone", unique: true
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true

  create_table "recruits", force: :cascade do |t|
    t.integer  "activities_id"
    t.integer  "player_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recruits", ["activities_id"], name: "index_recruits_on_activities_id"
  add_index "recruits", ["player_id"], name: "index_recruits_on_player_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "mark_id"
    t.integer  "expert_id"
    t.integer  "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["expert_id"], name: "index_tasks_on_expert_id"
  add_index "tasks", ["mark_id"], name: "index_tasks_on_mark_id"
  add_index "tasks", ["recruit_id"], name: "index_tasks_on_recruit_id"

  create_table "user_infos", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "id_card_type"
    t.string   "id_card"
    t.string   "nation"
    t.string   "gender"
    t.string   "tel"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "email"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "school_id"
    t.string   "type"
  end

  add_index "users", ["phone"], name: "index_users_on_phone", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["school_id"], name: "index_users_on_school_id"

end
