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

ActiveRecord::Schema.define(version: 20150711123840) do

  create_table "balloons", force: true do |t|
    t.integer  "pumps"
    t.boolean  "explosion"
    t.integer  "response_time"
    t.integer  "bart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "balloons", ["bart_id"], name: "index_balloons_on_bart_id"

  create_table "barts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinics", force: true do |t|
    t.string   "name"
    t.integer  "supervisor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinics", ["supervisor_id"], name: "index_clinics_on_supervisor_id"

  create_table "ddt_answers", force: true do |t|
    t.integer  "ddt_id"
    t.integer  "ddt_question_id"
    t.boolean  "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ddt_answers", ["ddt_id"], name: "index_ddt_answers_on_ddt_id"
  add_index "ddt_answers", ["ddt_question_id"], name: "index_ddt_answers_on_ddt_question_id"

  create_table "ddts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gonogos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "rectangles", force: true do |t|
    t.integer  "state"
    t.boolean  "is_clicked"
    t.integer  "display_time"
    t.integer  "response_time"
    t.integer  "reaction_time"
    t.integer  "gonogo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rectangles", ["gonogo_id"], name: "index_rectangles_on_gonogo_id"

  create_table "registrations", force: true do |t|
    t.integer  "user_id"
    t.integer  "clinic_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["clinic_id"], name: "index_registrations_on_clinic_id"
  add_index "registrations", ["patient_id"], name: "index_registrations_on_patient_id"
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id"

  create_table "stroops", force: true do |t|
    t.integer  "duration"
    t.integer  "total_items"
    t.integer  "correct_items"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.boolean  "confirmed"
    t.integer  "study_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["patient_id"], name: "index_tasks_on_patient_id"
  add_index "tasks", ["study_id"], name: "index_tasks_on_study_id"

  create_table "tests", force: true do |t|
    t.integer  "task_id"
    t.integer  "execution_schedule"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tests", ["task_id"], name: "index_tests_on_task_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
