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

ActiveRecord::Schema.define(version: 20150928194943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.integer  "user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "chats", ["project_id"], name: "index_chats_on_project_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "account_id"
    t.integer  "project_ids"
    t.integer  "role_ids"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invites", ["token"], name: "index_invites_on_token", using: :btree

  create_table "memberinvites", force: :cascade do |t|
    t.string   "email"
    t.integer  "account_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "member_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "associated_user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "account_id"
    t.integer  "user_id"
    t.integer  "associated_account_id"
  end

  add_index "memberships", ["account_id"], name: "index_memberships_on_account_id", using: :btree

  create_table "participations", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "associated_user_id"
    t.integer  "associated_project_id"
  end

  add_index "participations", ["project_id"], name: "index_participations_on_project_id", using: :btree
  add_index "participations", ["role_id"], name: "index_participations_on_role_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
    t.string   "slug"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "slug"
  end

  add_index "projects", ["account_id"], name: "index_projects_on_account_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "account_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chats", "projects"
  add_foreign_key "participations", "projects"
  add_foreign_key "participations", "roles"
  add_foreign_key "participations", "users"
  add_foreign_key "projects", "accounts"
end
