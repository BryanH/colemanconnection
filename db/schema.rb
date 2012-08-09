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

ActiveRecord::Schema.define(:version => 20120809155352) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "demographics", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip",                   :limit => 9
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.boolean  "current_hcc_student",                :default => false
    t.string   "current_hcc_college"
    t.string   "hcc_referral_source"
    t.string   "age_group"
    t.string   "gender"
    t.string   "first_program_choice"
    t.string   "second_program_choice"
    t.string   "preferred_start_date"
    t.boolean  "contact",                            :default => false
    t.integer  "contact_topics"
    t.integer  "contact_sources"
    t.string   "hcc_student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "other_advisor_college"
    t.string   "hcc_email_address"
  end

  create_table "er_dates", :force => true do |t|
    t.integer  "cap"
    t.datetime "session_time"
    t.boolean  "open"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "emails_sent_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "action"
    t.string   "subject_class"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["user_id"], :name => "index_permissions_on_user_id"

  create_table "program_dates", :force => true do |t|
    t.string   "program"
    t.datetime "occurs_on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "program_dates", ["occurs_on"], :name => "index_program_dates_on_occurs_on"
  add_index "program_dates", ["program"], :name => "index_program_dates_on_program"

  create_table "sessions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "er_date_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "cancelled_at"
    t.text     "breakout_session"
    t.boolean  "attended"
    t.boolean  "arrival_acknowledgement"
    t.integer  "program_date_id"
  end

  add_index "sessions", ["er_date_id"], :name => "index_sessions_on_er_date_id"
  add_index "sessions", ["program_date_id"], :name => "index_sessions_on_program_date_id"
  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",   :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "demographic_id"
    t.integer  "role_mask"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active",                                :default => true
    t.string   "type"
  end

  add_index "users", ["active"], :name => "index_users_on_active"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["demographic_id"], :name => "index_users_on_demographic_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["type"], :name => "index_users_on_type"

end
