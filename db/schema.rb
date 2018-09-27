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

ActiveRecord::Schema.define(version: 2018_09_27_035951) do

  create_table "discounted_parts", force: :cascade do |t|
    t.float "price"
    t.string "sku_label"
    t.string "reporting_make"
    t.string "brand_name"
    t.string "category_name"
    t.string "sub_category_name"
    t.string "functional_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "relative_price"
    t.float "discount"
    t.string "reporting_make"
    t.string "brand_name"
    t.string "category_name"
    t.string "sub_category_name"
    t.string "functional_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skus", force: :cascade do |t|
    t.string "sku_label"
    t.float "jit_cogs"
    t.float "domestic_stocking_cogs"
    t.float "best_stocking_cogs"
    t.float "genuine_price"
    t.string "reporting_make"
    t.string "brand_name"
    t.string "category_name"
    t.string "sub_category_name"
    t.string "functional_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
