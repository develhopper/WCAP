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

ActiveRecord::Schema.define(version: 20150712141143) do

  create_table "DdtQuestions_studies", id: false, force: true do |t|
    t.integer "ddt_question_id", null: false
    t.integer "study_id",        null: false
  end

  create_table "abusing_profiles", force: true do |t|
    t.integer  "cost_per_month"
    t.integer  "overdose_count"
    t.integer  "freakout_count"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abusing_profiles", ["patient_id"], name: "index_abusing_profiles_on_patient_id"

  create_table "abusings", force: true do |t|
    t.integer  "abusing_profile_id"
    t.integer  "drug_type"
    t.integer  "first_use_age"
    t.integer  "continuous_usage_duration"
    t.integer  "count"
    t.integer  "type"
    t.text     "description"
    t.boolean  "is_mainspring"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abusings", ["abusing_profile_id"], name: "index_abusings_on_abusing_profile_id"

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

  create_table "basic_demographics", force: true do |t|
    t.integer  "patient_id"
    t.integer  "file_number"
    t.integer  "private_code"
    t.integer  "gender"
    t.integer  "year_of_birth"
    t.date     "interview_date"
    t.integer  "marital_status"
    t.integer  "educational_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "basic_demographics", ["patient_id"], name: "index_basic_demographics_on_patient_id"

  create_table "clinics", force: true do |t|
    t.string   "name"
    t.integer  "supervisor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinics", ["supervisor_id"], name: "index_clinics_on_supervisor_id"

  create_table "clinics_users", id: false, force: true do |t|
    t.integer "user_id",   null: false
    t.integer "clinic_id", null: false
  end

  create_table "ddt_answers", force: true do |t|
    t.integer  "ddt_id"
    t.integer  "ddt_question_id"
    t.boolean  "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ddt_answers", ["ddt_id"], name: "index_ddt_answers_on_ddt_id"
  add_index "ddt_answers", ["ddt_question_id"], name: "index_ddt_answers_on_ddt_question_id"

  create_table "ddt_questions", force: true do |t|
    t.integer  "definite_value"
    t.integer  "indefinite_value"
    t.integer  "risk_rate"
    t.integer  "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "studies", force: true do |t|
    t.integer  "admin_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "studies", ["admin_id"], name: "index_studies_on_admin_id"

  create_table "studies_users", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "study_id", null: false
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

  create_table "test_details", force: true do |t|
    t.string   "name"
    t.integer  "count"
    t.integer  "part_count"
    t.integer  "study_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_details", ["study_id"], name: "index_test_details_on_study_id"

  create_table "tests", force: true do |t|
    t.integer  "task_id"
    t.integer  "execution_schedule"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tests", ["task_id"], name: "index_tests_on_task_id"

  create_table "treatment_histories", force: true do |t|
    t.integer  "patient_id"
    t.boolean  "is_cured"
    t.boolean  "in_month_treated"
    t.integer  "in_year_treat_count"
    t.boolean  "na_session"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatment_histories", ["patient_id"], name: "index_treatment_histories_on_patient_id"

  create_table "treatments", force: true do |t|
    t.integer  "treatment_history_id"
    t.integer  "type"
    t.integer  "count"
    t.integer  "max_avoidance_day"
    t.text     "descriptin"
    t.integer  "in_month_used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatments", ["treatment_history_id"], name: "index_treatments_on_treatment_history_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
