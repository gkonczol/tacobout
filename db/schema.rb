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

ActiveRecord::Schema.define(version: 2019_05_13_183123) do

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "spice", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "vegan", default: true
  end

  create_table "ingredients_tacos", id: false, force: :cascade do |t|
    t.integer "taco_id", null: false
    t.integer "ingredient_id", null: false
    t.index ["taco_id", "ingredient_id"], name: "index_ingredients_tacos_on_taco_id_and_ingredient_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.integer "taco_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_ratings_on_shop_id"
    t.index ["taco_id"], name: "index_ratings_on_taco_id"
  end

  create_table "shells", force: :cascade do |t|
    t.integer "primary_ingredient"
    t.boolean "soft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tacos", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "shell_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
