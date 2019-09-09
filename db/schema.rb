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

ActiveRecord::Schema.define(version: 2019_09_09_041321) do

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.integer "user_id"
    t.index ["code"], name: "index_products_on_code"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "payment", precision: 10, scale: 2
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "sales_products", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "quantity"
    t.integer "sale_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_sales_products_on_product_id"
    t.index ["sale_id"], name: "index_sales_products_on_sale_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "quantity"
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "products", "users"
  add_foreign_key "sales", "users"
  add_foreign_key "sales_products", "products"
  add_foreign_key "sales_products", "sales"
  add_foreign_key "stocks", "products"
end
