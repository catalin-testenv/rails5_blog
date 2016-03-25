# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160325122902) do

  create_table "layout_regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name",                     null: false
    t.text   "content", limit: 16777215
  end

  create_table "page_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.integer "parent_id", default: 0, null: false
    t.integer "ordering",  default: 0, null: false
  end

  create_table "page_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "page_id",                           null: false
    t.text    "content",          limit: 16777215, null: false
    t.text    "excerpt",          limit: 255
    t.text    "meta_description", limit: 255
    t.text    "meta_css",         limit: 16777215
    t.text    "meta_js",          limit: 16777215
  end

  add_index "page_contents", ["page_id"], name: "fk_page_id", using: :btree

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                           null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "is_main_nav",    default: false, null: false
    t.boolean  "is_commentable", default: false, null: false
    t.boolean  "published",      default: false, null: false
    t.integer  "parent_id",      default: 0,     null: false
    t.integer  "ordering",       default: 0,     null: false
    t.boolean  "root_page",      default: false, null: false
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "key",      null: false
    t.string  "val",      null: false
    t.string  "group",    null: false
    t.integer "ordering", null: false
    t.string  "kind",     null: false
    t.string  "cast",     null: false
    t.string  "options"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.integer  "role",       default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "page_contents", "pages", name: "fk_page_id", on_delete: :cascade
end
