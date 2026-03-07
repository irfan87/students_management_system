# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_07_193732) do
  create_table "course_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "day_of_week"
    t.integer "subject_id"
    t.integer "teacher_id"
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "course_session_id", null: false
    t.datetime "created_at", null: false
    t.date "enrolled_date"
    t.string "status"
    t.integer "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["course_session_id"], name: "index_enrollments_on_course_session_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "student_address"
    t.integer "student_age"
    t.date "student_birth_date"
    t.integer "student_gender", default: 0, null: false
    t.string "student_name"
    t.string "student_parent_name"
    t.string "student_phone_number"
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "level"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_sessions", "subjects"
  add_foreign_key "course_sessions", "teachers"
  add_foreign_key "enrollments", "course_sessions"
  add_foreign_key "enrollments", "students"
end
