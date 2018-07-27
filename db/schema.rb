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

ActiveRecord::Schema.define(version: 20180727002539) do

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_type", "associated_id"], name: "associated_index"
  add_index "audits", ["auditable_type", "auditable_id"], name: "auditable_index"
  add_index "audits", ["created_at"], name: "index_audits_on_created_at"
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid"
  add_index "audits", ["user_id", "user_type"], name: "user_index"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",               default: 0
    t.integer  "attempts",               default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "demographics", force: :cascade do |t|
    t.string   "address",               limit: 255
    t.string   "city",                  limit: 255
    t.string   "state",                 limit: 255
    t.string   "zip",                   limit: 9
    t.string   "home_phone",            limit: 255
    t.string   "mobile_phone",          limit: 255
    t.boolean  "current_hcc_student",               default: false
    t.string   "current_hcc_college",   limit: 255
    t.string   "hcc_referral_source",   limit: 255
    t.string   "age_group",             limit: 255
    t.string   "gender",                limit: 255
    t.string   "first_program_choice",  limit: 255
    t.string   "second_program_choice", limit: 255
    t.string   "preferred_start_date",  limit: 255
    t.boolean  "contact",                           default: false
    t.integer  "contact_topics"
    t.integer  "contact_sources"
    t.string   "hcc_student_id",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "other_advisor_college", limit: 255
    t.string   "hcc_email_address",     limit: 255
  end

  create_table "discipline_teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "color",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "er_dates", force: :cascade do |t|
    t.integer  "cap"
    t.datetime "session_time"
    t.boolean  "open"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "emails_sent_at"
  end

  create_table "pathway_settings", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "url",        limit: 255
    t.string   "tags",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "pathway_settings", ["program_id"], name: "index_pathway_settings_on_program_id"

  create_table "permissions", force: :cascade do |t|
    t.string   "action",        limit: 255
    t.string   "subject_class", limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id"

  create_table "program_dates", force: :cascade do |t|
    t.string   "program_string", limit: 255
    t.datetime "occurs_on"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "no_attendance",              default: false
    t.integer  "program_id"
  end

  add_index "program_dates", ["occurs_on"], name: "index_program_dates_on_occurs_on"
  add_index "program_dates", ["program_id"], name: "index_program_dates_on_program_id"
  add_index "program_dates", ["program_string"], name: "index_program_dates_on_program"

  create_table "programs", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "discipline_team_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "active",                         default: true
  end

  add_index "programs", ["discipline_team_id"], name: "index_programs_on_discipline_team_id"

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "er_date_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "cancelled_at"
    t.text     "breakout_session"
    t.boolean  "attended",                default: false
    t.boolean  "arrival_acknowledgement"
    t.integer  "program_date_id"
  end

  add_index "sessions", ["er_date_id"], name: "index_sessions_on_er_date_id"
  add_index "sessions", ["program_date_id"], name: "index_sessions_on_program_date_id"
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "survey_results", force: :cascade do |t|
    t.string   "result",          limit: 255, null: false
    t.text     "comment"
    t.string   "token",           limit: 255, null: false
    t.integer  "program_date_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "survey_results", ["program_date_id"], name: "index_survey_results_on_program_date_id"
  add_index "survey_results", ["token"], name: "index_survey_results_on_token", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 128, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "demographic_id"
    t.integer  "role_mask"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.boolean  "active",                             default: true
    t.string   "type",                   limit: 255
    t.string   "username",               limit: 255
    t.text     "program_affiliations"
  end

  add_index "users", ["active"], name: "index_users_on_active"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["demographic_id"], name: "index_users_on_demographic_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["type"], name: "index_users_on_type"

end
