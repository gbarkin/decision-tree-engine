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

ActiveRecord::Schema[8.1].define(version: 2025_12_07_164324) do
  create_table "answer_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "label", null: false
    t.integer "next_question_id"
    t.string "outcome_key"
    t.integer "position", default: 0, null: false
    t.integer "question_id", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["question_id"], name: "index_answer_options_on_question_id"
  end

  create_table "question_responses", force: :cascade do |t|
    t.integer "answer_option_id", null: false
    t.datetime "answered_at", null: false
    t.datetime "created_at", null: false
    t.text "free_text_answer"
    t.integer "question_id", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_run_id", null: false
    t.index ["answer_option_id"], name: "index_question_responses_on_answer_option_id"
    t.index ["question_id"], name: "index_question_responses_on_question_id"
    t.index ["workflow_run_id"], name: "index_question_responses_on_workflow_run_id"
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "kind", default: "multiple_choice", null: false
    t.integer "position", default: 0, null: false
    t.string "text", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_id", null: false
    t.index ["workflow_id"], name: "index_questions_on_workflow_id"
  end

  create_table "workflow_runs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "finished_at"
    t.string "outcome_key"
    t.integer "respondent_id"
    t.datetime "started_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_id", null: false
    t.index ["workflow_id"], name: "index_workflow_runs_on_workflow_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.integer "start_question_id"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answer_options", "questions"
  add_foreign_key "answer_options", "questions", column: "next_question_id"
  add_foreign_key "question_responses", "answer_options"
  add_foreign_key "question_responses", "questions"
  add_foreign_key "question_responses", "workflow_runs"
  add_foreign_key "questions", "workflows"
  add_foreign_key "workflow_runs", "workflows"
end
