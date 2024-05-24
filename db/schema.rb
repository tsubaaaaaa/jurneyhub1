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

ActiveRecord::Schema.define(version: 2024_04_14_074017) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "hokkaido_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hokkaido_id"], name: "index_comments_on_hokkaido_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hashname"], name: "index_hashtags_on_hashname", unique: true
  end

  create_table "hokkaido_hashtag_relations", force: :cascade do |t|
    t.integer "hokkaido_id"
    t.integer "hashtag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hashtag_id"], name: "index_hokkaido_hashtag_relations_on_hashtag_id"
    t.index ["hokkaido_id"], name: "index_hokkaido_hashtag_relations_on_hokkaido_id"
  end

  create_table "hokkaidos", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "user_id"
    t.text "body"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "hokkaido_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hokkaido_id"], name: "index_likes_on_hokkaido_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "tag1s", force: :cascade do |t|
    t.string "tag1_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "hokkaido_id", null: false
    t.integer "tag1_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hokkaido_id"], name: "index_tag_maps_on_hokkaido_id"
    t.index ["tag1_id"], name: "index_tag_maps_on_tag1_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.string "profile_photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "hokkaidos"
  add_foreign_key "comments", "users"
  add_foreign_key "hokkaido_hashtag_relations", "hashtags"
  add_foreign_key "hokkaido_hashtag_relations", "hokkaidos"
  add_foreign_key "likes", "hokkaidos"
  add_foreign_key "likes", "users"
  add_foreign_key "tag_maps", "hokkaidos"
  add_foreign_key "tag_maps", "tag1s"
end
