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

ActiveRecord::Schema[8.0].define(version: 2018_07_21_204135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", id: :serial, force: :cascade do |t|
    t.text "preview"
    t.text "content"
    t.string "preview_img"
    t.string "keywords"
    t.string "description"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_blogs_on_slug"
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "films", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "preview"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pages_on_name"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.string "description"
    t.string "avatar"
    t.json "photos"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "products_type"
    t.string "slug"
    t.string "meta_description", default: ""
    t.string "meta_keywords", default: ""
    t.index ["slug"], name: "index_products_on_slug"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "keywords"
    t.string "description"
    t.string "preview_img"
    t.text "content"
    t.text "preview"
    t.json "photos"
    t.string "slug", default: ""
    t.index ["slug"], name: "index_projects_on_slug"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "job", null: false
    t.string "content", null: false
    t.string "photo", null: false
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.integer "sale_price"
    t.integer "amount"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "preview"
    t.string "features"
    t.string "meta_description", default: ""
    t.string "meta_keywords", default: ""
    t.string "slug"
    t.index ["slug"], name: "index_stocks_on_slug"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
