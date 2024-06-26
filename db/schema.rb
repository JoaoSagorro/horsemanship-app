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

ActiveRecord::Schema[7.1].define(version: 2024_04_16_105757) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aluno_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "morada"
    t.date "birthdate"
    t.integer "nif"
    t.integer "numero_utente"
    t.integer "cartao_cidadao"
    t.date "validity"
    t.integer "contacto"
    t.string "encarregado_educação"
    t.string "grau_parentesco"
    t.integer "contacto_emergencia"
    t.string "aulas"
    t.string "horario_preferencial"
    t.boolean "recolha_dados"
    t.boolean "fotografias_captadas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_aluno_profiles_on_user_id"
  end

  create_table "aulas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "class_type"
    t.string "comments"
    t.date "occurs_date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spots"
    t.string "creator"
    t.string "teacher"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "attendees", default: 1
    t.boolean "status", default: false
    t.bigint "user_id", null: false
    t.bigint "aula_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aula_id"], name: "index_bookings_on_aula_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "user_aulas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "aula_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aula_id"], name: "index_user_aulas_on_aula_id"
    t.index ["user_id"], name: "index_user_aulas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role", default: 0
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aluno_profiles", "users"
  add_foreign_key "bookings", "aulas"
  add_foreign_key "bookings", "users"
  add_foreign_key "user_aulas", "aulas"
  add_foreign_key "user_aulas", "users"
end
