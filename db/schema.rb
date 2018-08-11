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

ActiveRecord::Schema.define(version: 20180603162654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capitulos", force: :cascade do |t|
    t.string "Titulo"
    t.string "Temporada"
    t.string "Video"
    t.text "Descripcion"
    t.integer "Episodio"
    t.bigint "Serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "temporada_id"
    t.index ["Serie_id"], name: "index_capitulos_on_Serie_id"
    t.index ["temporada_id"], name: "index_capitulos_on_temporada_id"
  end

  create_table "categoria", force: :cascade do |t|
    t.string "Descripcion"
    t.string "Color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentariocaps", force: :cascade do |t|
    t.string "Nombre"
    t.string "Correo"
    t.text "Comentario"
    t.bigint "Capitulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Capitulo_id"], name: "index_comentariocaps_on_Capitulo_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "Nombre"
    t.string "Correo"
    t.text "Comentario"
    t.bigint "Serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Serie_id"], name: "index_comentarios_on_Serie_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "Titulo"
    t.string "descripcion"
    t.string "Idioma"
    t.integer "Ano"
    t.integer "Episodios"
    t.string "Estatus"
    t.integer "Valoracion"
    t.bigint "Categoria_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Portada_file_name"
    t.string "Portada_content_type"
    t.integer "Portada_file_size"
    t.datetime "Portada_updated_at"
    t.string "Fondo_file_name"
    t.string "Fondo_content_type"
    t.integer "Fondo_file_size"
    t.datetime "Fondo_updated_at"
    t.index ["Categoria_id"], name: "index_series_on_Categoria_id"
  end

  create_table "temporadas", force: :cascade do |t|
    t.string "Descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "NombreCompleto"
    t.string "Correo"
    t.string "Estatus"
    t.string "Tipo"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "capitulos", "temporadas"
end
