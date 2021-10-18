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

ActiveRecord::Schema.define(version: 2021_10_18_022710) do

  create_table "developers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_developers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.date "birth_date"
    t.string "education"
    t.string "skills"
    t.string "employment_history"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "developer_id", null: false
    t.index ["developer_id"], name: "index_profiles_on_developer_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "requirements"
    t.decimal "hourly_rate"
    t.date "expiration_date"
    t.boolean "require_presential_meetings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "manager_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.index ["manager_id"], name: "index_projects_on_manager_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "motivation"
    t.decimal "hourly_rate"
    t.integer "weekly_available_hours"
    t.date "expected_completion"
    t.integer "project_id", null: false
    t.integer "developer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 5
    t.index ["developer_id"], name: "index_proposals_on_developer_id"
    t.index ["project_id"], name: "index_proposals_on_project_id"
  end

  add_foreign_key "profiles", "developers"
  add_foreign_key "projects", "managers"
  add_foreign_key "proposals", "developers"
  add_foreign_key "proposals", "projects"
end
