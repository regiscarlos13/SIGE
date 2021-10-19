# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_29_121113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "disciplinaturmas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "turma_id"
    t.uuid "teacher_id"
    t.uuid "subject_id"
    t.integer "hora"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_disciplinaturmas_on_subject_id"
    t.index ["teacher_id"], name: "index_disciplinaturmas_on_teacher_id"
    t.index ["turma_id"], name: "index_disciplinaturmas_on_turma_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.date "start"
    t.date "end"
    t.uuid "year_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year_id"], name: "index_events_on_year_id"
  end

  create_table "matriculas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "year_id"
    t.uuid "student_id"
    t.uuid "turma_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_matriculas_on_student_id"
    t.index ["turma_id"], name: "index_matriculas_on_turma_id"
    t.index ["year_id"], name: "index_matriculas_on_year_id"
  end

  create_table "schools", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.boolean "bloquear"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "series", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_series_on_school_id"
  end

  create_table "situations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "matricula_id"
    t.integer "tipo"
    t.integer "situacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matricula_id"], name: "index_situations_on_matricula_id"
  end

  create_table "students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "rg"
    t.date "nascimento"
    t.string "censo"
    t.string "mae"
    t.string "pai"
    t.string "cpf"
    t.string "cep"
    t.string "bairro"
    t.string "cidade"
    t.string "rua"
    t.string "uf"
    t.string "numero"
    t.string "complemento"
    t.string "naturalidade"
    t.integer "sexo"
    t.boolean "necessidade"
    t.uuid "school_id"
    t.string "cpfmae"
    t.string "cpfpai"
    t.string "telefone"
    t.string "email"
    t.string "cpf_financeiro"
    t.string "nome_financeiro"
    t.string "cep_financeiro"
    t.string "bairro_financeiro"
    t.string "cidade_financeiro"
    t.string "rua_financeiro"
    t.string "uf_financeiro"
    t.string "numero_financeiro"
    t.string "complemento_financeiro"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "subjects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_subjects_on_school_id"
  end

  create_table "teachers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "cpf"
    t.string "name"
    t.string "cep"
    t.string "bairro"
    t.string "cidade"
    t.string "rua"
    t.string "uf"
    t.string "numero"
    t.string "complemento"
    t.uuid "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  create_table "turmas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "serie_id"
    t.uuid "year_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["serie_id"], name: "index_turmas_on_serie_id"
    t.index ["year_id"], name: "index_turmas_on_year_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpf"
    t.string "name"
    t.uuid "school_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  create_table "years", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "year"
    t.decimal "media"
    t.date "inicio"
    t.date "fim"
    t.date "inicio1"
    t.date "fim1"
    t.date "inicio2"
    t.date "fim2"
    t.date "inicio3"
    t.date "fim3"
    t.date "inicio4"
    t.date "fim4"
    t.date "inicior"
    t.date "fimr"
    t.boolean "concluido"
    t.uuid "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_years_on_school_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "disciplinaturmas", "subjects"
  add_foreign_key "disciplinaturmas", "teachers"
  add_foreign_key "disciplinaturmas", "turmas"
  add_foreign_key "events", "years"
  add_foreign_key "matriculas", "students"
  add_foreign_key "matriculas", "turmas"
  add_foreign_key "matriculas", "years"
  add_foreign_key "series", "schools"
  add_foreign_key "situations", "matriculas"
  add_foreign_key "students", "schools"
  add_foreign_key "subjects", "schools"
  add_foreign_key "teachers", "schools"
  add_foreign_key "turmas", "series"
  add_foreign_key "turmas", "years"
  add_foreign_key "users", "schools"
  add_foreign_key "years", "schools"
end
