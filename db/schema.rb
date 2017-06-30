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

ActiveRecord::Schema.define(version: 20170630163415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pesajes", force: :cascade do |t|
    t.string   "id_2"
    t.date     "parto"
    t.date     "pesaje"
    t.integer  "del"
    t.decimal  "lvd"
    t.string   "raza"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lactancia"
  end

  create_table "reproduccions", force: :cascade do |t|
    t.string   "id_2"
    t.date     "nacimiento"
    t.integer  "anonac"
    t.string   "padre"
    t.string   "madre"
    t.integer  "lact"
    t.string   "id_lact"
    t.date     "parto"
    t.integer  "anopart"
    t.integer  "mesparto"
    t.string   "cria"
    t.string   "sexo_cria"
    t.string   "padre_cria"
    t.integer  "meses_parto"
    t.date     "prenez"
    t.string   "toro_prenez"
    t.integer  "servicios"
    t.date     "secado"
    t.decimal  "lechetotal"
    t.integer  "del"
    t.decimal  "acum_305d"
    t.string   "removida"
    t.date     "fecha_salida"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ipp"
  end

  create_table "vacas", force: :cascade do |t|
    t.integer  "id_2"
    t.integer  "anonac"
    t.string   "padre"
    t.integer  "nropar"
    t.decimal  "grupo_racial"
    t.string   "tipser"
    t.string   "toroas"
    t.string   "diagno"
    t.date     "fparto"
    t.string   "becerro"
    t.string   "sexo"
    t.decimal  "pesonacer"
    t.decimal  "pesodestete"
    t.decimal  "peso18"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
