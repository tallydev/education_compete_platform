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

ActiveRecord::Schema.define(version: 20161201144239) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "status",     limit: 4,   default: 0
    t.string   "type",       limit: 255
    t.string   "short_name", limit: 255
    t.boolean  "offline"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
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
    t.string   "type",                   limit: 255
    t.string   "tag",                    limit: 255
    t.string   "authentication_token",   limit: 30
  end

  add_index "admins", ["authentication_token"], name: "index_admins_on_authentication_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["school_id"], name: "index_admins_on_school_id", using: :btree

  create_table "appraises", force: :cascade do |t|
    t.integer  "player_id",          limit: 4
    t.integer  "teacher_id",         limit: 4
    t.text     "remark",             limit: 65535
    t.string   "degree",             limit: 255
    t.integer  "training_course_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "appraises", ["player_id"], name: "index_appraises_on_player_id", using: :btree
  add_index "appraises", ["teacher_id"], name: "index_appraises_on_teacher_id", using: :btree
  add_index "appraises", ["training_course_id"], name: "index_appraises_on_training_course_id", using: :btree

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

  create_table "events", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.text     "content",                  limit: 65535
    t.integer  "classify",                 limit: 4,     default: 1
    t.string   "picture_url",              limit: 255
    t.boolean  "is_competition"
    t.string   "picture_url_file_name",    limit: 255
    t.string   "picture_url_content_type", limit: 255
    t.integer  "picture_url_file_size",    limit: 4
    t.datetime "picture_url_updated_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
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
    t.string   "type",                   limit: 255
    t.string   "tag",                    limit: 255
  end

  add_index "experts", ["email"], name: "index_experts_on_email", unique: true, using: :btree
  add_index "experts", ["reset_password_token"], name: "index_experts_on_reset_password_token", unique: true, using: :btree
  add_index "experts", ["school_id"], name: "index_experts_on_school_id", using: :btree

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

  create_table "info_competition_opuses", force: :cascade do |t|
    t.integer  "recruit_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "content",    limit: 255
  end

  add_index "info_competition_opuses", ["recruit_id"], name: "index_info_competition_opuses_on_recruit_id", using: :btree

  create_table "info_competition_recruits", force: :cascade do |t|
    t.integer  "player_id",     limit: 4
    t.integer  "school_id",     limit: 4
    t.integer  "activity_id",   limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "project",       limit: 255
    t.string   "name",          limit: 255
    t.string   "version",       limit: 255
    t.text     "comment",       limit: 65535
    t.string   "cooperater_1",  limit: 255
    t.string   "school_1",      limit: 255
    t.string   "course_1",      limit: 255
    t.string   "cooperater_2",  limit: 255
    t.string   "school_2",      limit: 255
    t.string   "course_2",      limit: 255
    t.string   "cooperater_3",  limit: 255
    t.string   "school_3",      limit: 255
    t.string   "course_3",      limit: 255
    t.string   "school_person", limit: 255
    t.string   "school_phone",  limit: 255
    t.integer  "total_score",   limit: 4,     default: 0
    t.float    "avg_score",     limit: 24
    t.integer  "score_count",   limit: 4
    t.integer  "position",      limit: 4
  end

  add_index "info_competition_recruits", ["activity_id"], name: "index_info_competition_recruits_on_activity_id", using: :btree
  add_index "info_competition_recruits", ["player_id"], name: "index_info_competition_recruits_on_player_id", using: :btree
  add_index "info_competition_recruits", ["school_id"], name: "index_info_competition_recruits_on_school_id", using: :btree

  create_table "journals", force: :cascade do |t|
    t.integer  "player_id",          limit: 4
    t.integer  "training_course_id", limit: 4
    t.string   "title",              limit: 255
    t.text     "content",            limit: 65535
    t.datetime "add_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "journals", ["player_id"], name: "index_journals_on_player_id", using: :btree
  add_index "journals", ["training_course_id"], name: "index_journals_on_training_course_id", using: :btree

  create_table "manager_feedbacks", force: :cascade do |t|
    t.integer  "manager_id",          limit: 4
    t.integer  "training_course_id",  limit: 4
    t.string   "organizer",           limit: 255
    t.string   "total_hours",         limit: 255
    t.string   "total_expenses",      limit: 255
    t.text     "total_expenses_info", limit: 65535
    t.text     "feedback",            limit: 65535
    t.text     "remark",              limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "manager_feedbacks", ["manager_id"], name: "index_manager_feedbacks_on_manager_id", using: :btree
  add_index "manager_feedbacks", ["training_course_id"], name: "index_manager_feedbacks_on_training_course_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
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
    t.string   "type",                   limit: 255
    t.string   "tag",                    limit: 255
    t.string   "authentication_token",   limit: 30
  end

  add_index "managers", ["authentication_token"], name: "index_managers_on_authentication_token", unique: true, using: :btree
  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree
  add_index "managers", ["school_id"], name: "index_managers_on_school_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.float    "score",            limit: 24
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "item_array",       limit: 65535
    t.integer  "expert_id",        limit: 4
    t.integer  "recruitable_id",   limit: 4
    t.string   "recruitable_type", limit: 255
  end

  add_index "marks", ["expert_id"], name: "index_marks_on_expert_id", using: :btree
  add_index "marks", ["recruitable_type", "recruitable_id"], name: "index_marks_on_recruitable_type_and_recruitable_id", using: :btree

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

  create_table "messages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

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

  create_table "player_feedbacks", force: :cascade do |t|
    t.integer  "player_id",          limit: 4
    t.integer  "training_course_id", limit: 4
    t.string   "teach",              limit: 255
    t.string   "discussion",         limit: 255
    t.string   "visiting",           limit: 255
    t.string   "organization",       limit: 255
    t.string   "study_life",         limit: 255
    t.text     "most_value",         limit: 65535
    t.text     "most_gain",          limit: 65535
    t.text     "graduate_message",   limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "player_feedbacks", ["player_id"], name: "index_player_feedbacks_on_player_id", using: :btree
  add_index "player_feedbacks", ["training_course_id"], name: "index_player_feedbacks_on_training_course_id", using: :btree

  create_table "player_infos", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "card_number",        limit: 255
    t.string   "address",            limit: 255
    t.string   "code",               limit: 255
    t.integer  "sex",                limit: 4
    t.string   "nation",             limit: 255
    t.integer  "player_id",          limit: 4
    t.integer  "school_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "birth"
    t.string   "professional_title", limit: 255
    t.string   "degree",             limit: 255
    t.string   "special",            limit: 255
    t.string   "email",              limit: 255
  end

  add_index "player_infos", ["player_id"], name: "index_player_infos_on_player_id", using: :btree
  add_index "player_infos", ["school_id"], name: "index_player_infos_on_school_id", using: :btree

  create_table "player_messages", force: :cascade do |t|
    t.integer  "player_id",  limit: 4
    t.integer  "message_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "player_messages", ["message_id"], name: "index_player_messages_on_message_id", using: :btree
  add_index "player_messages", ["player_id"], name: "index_player_messages_on_player_id", using: :btree

  create_table "player_tasks", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.string   "appraise",   limit: 255
    t.integer  "task_id",    limit: 4
    t.integer  "player_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "player_tasks", ["player_id"], name: "index_player_tasks_on_player_id", using: :btree
  add_index "player_tasks", ["task_id"], name: "index_player_tasks_on_task_id", using: :btree

  create_table "player_training_courses", force: :cascade do |t|
    t.integer  "player_id",          limit: 4
    t.integer  "training_course_id", limit: 4
    t.string   "aasm_state",         limit: 255
    t.text     "remark",             limit: 65535
    t.string   "certificate_no",     limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "player_training_courses", ["player_id"], name: "index_player_training_courses_on_player_id", using: :btree
  add_index "player_training_courses", ["training_course_id"], name: "index_player_training_courses_on_training_course_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "phone",                  limit: 255,   default: "",   null: false
    t.string   "encrypted_password",     limit: 255,   default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "school_id",              limit: 4
    t.string   "authentication_token",   limit: 30
    t.string   "name",                   limit: 255
    t.string   "ID_number",              limit: 255
    t.boolean  "gender",                               default: true
    t.date     "birth"
    t.string   "school",                 limit: 255
    t.string   "academy",                limit: 255
    t.string   "certificate",            limit: 255
    t.string   "city",                   limit: 255
    t.string   "nation",                 limit: 255
    t.string   "position_name",          limit: 255
    t.string   "position",               limit: 255
    t.string   "address",                limit: 255
    t.string   "zip_code",               limit: 255
    t.string   "telephone",              limit: 255
    t.string   "email",                  limit: 255
    t.string   "qq_no",                  limit: 255
    t.text     "summary",                limit: 65535
    t.string   "country",                limit: 255
    t.text     "text",                   limit: 65535
    t.string   "profssion",              limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "players", ["authentication_token"], name: "index_players_on_authentication_token", unique: true, using: :btree
  add_index "players", ["phone"], name: "index_players_on_phone", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  add_index "players", ["school_id"], name: "index_players_on_school_id", using: :btree

  create_table "resource_libraries", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "catalog",    limit: 4
    t.string   "mdate",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "school_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
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
    t.string   "typegit",                limit: 255
    t.string   "tag",                    limit: 255
  end

  add_index "school_users", ["email"], name: "index_school_users_on_email", unique: true, using: :btree
  add_index "school_users", ["reset_password_token"], name: "index_school_users_on_reset_password_token", unique: true, using: :btree
  add_index "school_users", ["school_id"], name: "index_school_users_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string   "type",              limit: 255
    t.string   "sound_type",        limit: 255
    t.integer  "resourse_id",       limit: 4
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "soundable_id",      limit: 4
    t.string   "soundable_type",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "talk_competition_opuses", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "recruit_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "talk_competition_opuses", ["recruit_id"], name: "index_talk_competition_opuses_on_recruit_id", using: :btree

  create_table "talk_competition_recruits", force: :cascade do |t|
    t.integer  "player_id",     limit: 4
    t.integer  "school_id",     limit: 4
    t.integer  "activity_id",   limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "school_person", limit: 255
    t.string   "school_phone",  limit: 255
    t.string   "name",          limit: 255
    t.text     "comment",       limit: 65535
    t.string   "work_time",     limit: 255
    t.integer  "total_score",   limit: 4,     default: 0
    t.float    "avg_score",     limit: 24
    t.integer  "score_count",   limit: 4
    t.integer  "position",      limit: 4
  end

  add_index "talk_competition_recruits", ["activity_id"], name: "index_talk_competition_recruits_on_activity_id", using: :btree
  add_index "talk_competition_recruits", ["player_id"], name: "index_talk_competition_recruits_on_player_id", using: :btree
  add_index "talk_competition_recruits", ["school_id"], name: "index_talk_competition_recruits_on_school_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "mark_id",             limit: 4
    t.integer  "expert_id",           limit: 4
    t.integer  "recruit_id",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "title",               limit: 255
    t.text     "body",                limit: 65535
    t.integer  "submit_player_count", limit: 4
    t.integer  "training_course_id",  limit: 4
    t.integer  "admin_id",            limit: 4
  end

  add_index "tasks", ["admin_id"], name: "index_tasks_on_admin_id", using: :btree
  add_index "tasks", ["expert_id"], name: "index_tasks_on_expert_id", using: :btree
  add_index "tasks", ["mark_id"], name: "index_tasks_on_mark_id", using: :btree
  add_index "tasks", ["recruit_id"], name: "index_tasks_on_recruit_id", using: :btree
  add_index "tasks", ["training_course_id"], name: "index_tasks_on_training_course_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "id_card",    limit: 255
    t.string   "province",   limit: 255
    t.string   "position",   limit: 255
    t.string   "sex",        limit: 255
    t.text     "remark",     limit: 65535
    t.string   "address",    limit: 255
    t.string   "mobile",     limit: 255
    t.string   "phone",      limit: 255
    t.string   "qq",         limit: 255
    t.string   "email",      limit: 255
    t.string   "postcode",   limit: 255
    t.string   "job_title",  limit: 255
    t.integer  "school_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "teachers", ["school_id"], name: "index_teachers_on_school_id", using: :btree

  create_table "training_course_teachers", force: :cascade do |t|
    t.integer  "teacher_id",         limit: 4
    t.integer  "training_course_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "training_course_teachers", ["teacher_id"], name: "index_training_course_teachers_on_teacher_id", using: :btree
  add_index "training_course_teachers", ["training_course_id"], name: "index_training_course_teachers_on_training_course_id", using: :btree

  create_table "training_courses", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "code",                 limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "plan_number",          limit: 4
    t.string   "grade_leader",         limit: 255
    t.string   "training_agency",      limit: 255
    t.string   "training_address",     limit: 255
    t.decimal  "training_fee",                       precision: 5, scale: 2
    t.string   "state",                limit: 255
    t.text     "remark",               limit: 65535
    t.string   "info",                 limit: 255
    t.string   "training_backgrounds", limit: 255
    t.string   "training_target",      limit: 255
    t.text     "training_content",     limit: 65535
    t.text     "check_method",         limit: 65535
    t.string   "project_leader",       limit: 255
    t.string   "contact",              limit: 255
    t.integer  "school_id",            limit: 4
    t.string   "aasm_state",           limit: 255
    t.string   "category",             limit: 255
    t.boolean  "be_applied"
    t.integer  "notification_id",      limit: 4
    t.datetime "start_apply_time"
    t.datetime "end_apply_time"
    t.integer  "admin_id",             limit: 4
    t.string   "linkman",              limit: 255
    t.string   "phone",                limit: 255
    t.string   "fax",                  limit: 255
    t.string   "mobile",               limit: 255
    t.string   "email",                limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "training_courses", ["admin_id"], name: "index_training_courses_on_admin_id", using: :btree
  add_index "training_courses", ["school_id"], name: "index_training_courses_on_school_id", using: :btree

  create_table "training_notifications", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "sub_title",  limit: 255
    t.integer  "view_count", limit: 4,     default: 0
    t.string   "author",     limit: 255
    t.text     "content",    limit: 65535
    t.string   "category",   limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

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
    t.string   "tag",                    limit: 255
    t.string   "authentication_token",   limit: 30
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

  add_foreign_key "admins", "schools"
  add_foreign_key "experts", "schools"
  add_foreign_key "journals", "players"
  add_foreign_key "journals", "training_courses"
  add_foreign_key "manager_feedbacks", "admins", column: "manager_id"
  add_foreign_key "manager_feedbacks", "training_courses"
  add_foreign_key "managers", "schools"
  add_foreign_key "player_messages", "messages"
  add_foreign_key "player_messages", "players"
  add_foreign_key "player_tasks", "players"
  add_foreign_key "player_tasks", "tasks"
  add_foreign_key "school_users", "schools"
  add_foreign_key "training_courses", "admins"
  add_foreign_key "training_courses", "schools"
end
