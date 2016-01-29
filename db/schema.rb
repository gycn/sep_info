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

ActiveRecord::Schema.define(version: 20160129064812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "year"
    t.string   "major"
    t.text     "extracurriculars"
    t.text     "hobbies"
    t.text     "why_sep"
    t.text     "short_answer1"
    t.text     "short_answer2"
    t.text     "short_answer3"
    t.text     "short_answer4"
    t.string   "reference"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.text     "availabilities"
    t.boolean  "submitted",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coffee_chats", force: true do |t|
    t.string   "interviewer_1"
    t.string   "interviewer_2"
    t.integer  "overall"
    t.integer  "empathy"
    t.integer  "grit"
    t.integer  "curiosity"
    t.integer  "analytical"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "group_interviews", force: true do |t|
    t.string   "author"
    t.integer  "score"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "interviews", force: true do |t|
    t.string   "interviewer_1"
    t.string   "interviewer_2"
    t.string   "interviewer_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
    t.decimal  "gpa"
    t.integer  "score_1"
    t.text     "question_1"
    t.integer  "score_2"
    t.text     "question_2"
    t.integer  "score_3"
    t.text     "question_3"
    t.integer  "score_4"
    t.text     "question_4"
    t.integer  "score_5"
    t.text     "question_5"
    t.integer  "score_6"
    t.text     "question_6"
    t.integer  "overall"
    t.text     "question_7"
    t.text     "question_8"
    t.text     "comments"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.boolean  "brother"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
