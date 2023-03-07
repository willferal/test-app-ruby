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

ActiveRecord::Schema[7.0].define(version: 2022_12_06_031301) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "atuacoes", force: :cascade do |t|
    t.string "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "entidade_atuacoes", force: :cascade do |t|
    t.bigint "entidade_id", null: false
    t.bigint "atuacao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atuacao_id"], name: "index_entidade_atuacoes_on_atuacao_id"
    t.index ["entidade_id"], name: "index_entidade_atuacoes_on_entidade_id"
  end

  create_table "entidades", force: :cascade do |t|
    t.string "nome", null: false
    t.string "cpf_cnpj", null: false
    t.string "razao_social"
    t.string "endereco"
    t.string "numero_endereco"
    t.string "complemento_endereco"
    t.string "bairro_endereco"
    t.bigint "municipio_id"
    t.bigint "tipo_entidade_id", null: false
    t.bigint "origem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["municipio_id"], name: "index_entidades_on_municipio_id"
    t.index ["origem_id"], name: "index_entidades_on_origem_id"
    t.index ["tipo_entidade_id"], name: "index_entidades_on_tipo_entidade_id"
  end

  create_table "fotos", force: :cascade do |t|
    t.string "nome_arquivo"
    t.string "token"
    t.bigint "servico_id", null: false
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "principal"
    t.integer "posicao"
    t.index ["servico_id"], name: "index_fotos_on_servico_id"
  end

  create_table "informacao_detalhes", force: :cascade do |t|
    t.string "descricao"
    t.string "titulo", null: false
    t.bigint "informacao_id", null: false
    t.integer "posicao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["informacao_id"], name: "index_informacao_detalhes_on_informacao_id"
  end

  create_table "informacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "titulo", null: false
    t.bigint "situacao_id", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "posicao"
    t.boolean "destaque", default: false, null: false
    t.bigint "autor_id"
    t.index ["autor_id"], name: "index_informacoes_on_autor_id"
    t.index ["situacao_id"], name: "index_informacoes_on_situacao_id"
  end

  create_table "modulo_detalhes", force: :cascade do |t|
    t.string "titulo", null: false
    t.bigint "modulo_id", null: false
    t.integer "posicao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["modulo_id"], name: "index_modulo_detalhes_on_modulo_id"
  end

  create_table "modulos", force: :cascade do |t|
    t.string "titulo"
    t.string "descricao"
    t.string "icone"
    t.string "url"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "posicao"
    t.boolean "texto_aprovado"
    t.bigint "autor_id"
    t.index ["autor_id"], name: "index_modulos_on_autor_id"
  end

  create_table "municipios", force: :cascade do |t|
    t.string "descricao", null: false
    t.bigint "uf_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["uf_id"], name: "index_municipios_on_uf_id"
  end

  create_table "notificacoes", force: :cascade do |t|
    t.integer "vigencia", null: false
    t.datetime "data_hora", null: false
    t.string "assunto", null: false
    t.bigint "situacao_id", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "user_id"
    t.index ["situacao_id"], name: "index_notificacoes_on_situacao_id"
    t.index ["user_id"], name: "index_notificacoes_on_user_id"
  end

  create_table "origens", force: :cascade do |t|
    t.string "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "servico_detalhes", force: :cascade do |t|
    t.bigint "servico_id", null: false
    t.bigint "tipo_detalhe_id", null: false
    t.string "titulo", null: false
    t.integer "posicao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["servico_id"], name: "index_servico_detalhes_on_servico_id"
    t.index ["tipo_detalhe_id"], name: "index_servico_detalhes_on_tipo_detalhe_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.bigint "tipo_servico_id", null: false
    t.bigint "entidade_id", null: false
    t.date "vigencia_inicial"
    t.date "vigencia_final"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "texto_aprovado"
    t.bigint "user_id"
    t.index ["entidade_id"], name: "index_servicos_on_entidade_id"
    t.index ["tipo_servico_id"], name: "index_servicos_on_tipo_servico_id"
    t.index ["user_id"], name: "index_servicos_on_user_id"
  end

  create_table "situacoes", force: :cascade do |t|
    t.string "descricao", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "tipo_detalhes", force: :cascade do |t|
    t.string "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "tipo_entidades", force: :cascade do |t|
    t.string "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "tipo_servicos", force: :cascade do |t|
    t.string "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "ufs", force: :cascade do |t|
    t.string "descricao"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "login"
    t.string "email", default: "", null: false
    t.string "cpf"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "refresh_token"
    t.string "access_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "entidade_atuacoes", "atuacoes"
  add_foreign_key "entidade_atuacoes", "entidades"
  add_foreign_key "entidades", "municipios"
  add_foreign_key "entidades", "origens"
  add_foreign_key "entidades", "tipo_entidades"
  add_foreign_key "fotos", "servicos"
  add_foreign_key "informacao_detalhes", "informacoes"
  add_foreign_key "informacoes", "situacoes"
  add_foreign_key "informacoes", "users", column: "autor_id"
  add_foreign_key "modulo_detalhes", "modulos"
  add_foreign_key "modulos", "users", column: "autor_id"
  add_foreign_key "municipios", "ufs"
  add_foreign_key "notificacoes", "situacoes"
  add_foreign_key "notificacoes", "users"
  add_foreign_key "servico_detalhes", "servicos"
  add_foreign_key "servico_detalhes", "tipo_detalhes"
  add_foreign_key "servicos", "entidades"
  add_foreign_key "servicos", "tipo_servicos"
  add_foreign_key "servicos", "users"
end
