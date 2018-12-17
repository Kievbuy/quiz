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

ActiveRecord::Schema.define(version: 2018_12_14_211444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "examination_id"
    t.bigint "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_answers_on_examination_id"
    t.index ["option_id"], name: "index_answers_on_option_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
  end

  create_table "examinations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_examinations_on_quiz_id"
    t.index ["user_id"], name: "index_examinations_on_user_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_instructions_on_category_id"
  end

  create_table "instructions_quizzes", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "instruction_id"
    t.index ["instruction_id"], name: "index_instructions_quizzes_on_instruction_id"
    t.index ["quiz_id", "instruction_id"], name: "index_instructions_quizzes_on_quiz_id_and_instruction_id", unique: true
    t.index ["quiz_id"], name: "index_instructions_quizzes_on_quiz_id"
  end

  create_table "instructions_users", force: :cascade do |t|
    t.bigint "instruction_id"
    t.bigint "user_id"
    t.index ["instruction_id", "user_id"], name: "index_instructions_users_on_instruction_id_and_user_id", unique: true
    t.index ["instruction_id"], name: "index_instructions_users_on_instruction_id"
    t.index ["user_id"], name: "index_instructions_users_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.text "body"
    t.boolean "correct"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_quizzes", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_questions_quizzes_on_question_id"
    t.index ["quiz_id", "question_id"], name: "index_questions_quizzes_on_quiz_id_and_question_id", unique: true
    t.index ["quiz_id"], name: "index_questions_quizzes_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.integer "level"
    t.boolean "active"
    t.integer "answers_to_pass"
    t.integer "percent_to_pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
