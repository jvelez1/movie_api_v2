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

ActiveRecord::Schema.define(version: 2021_01_19_190652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_logs", force: :cascade do |t|
    t.string "path", null: false
    t.integer "counter", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["path", "user_id"], name: "index_activity_logs_on_path_and_user_id", unique: true
    t.index ["path"], name: "index_activity_logs_on_path"
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code", null: false
    t.boolean "taken", default: false
    t.index ["code"], name: "index_coupons_on_code"
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.string "title", null: false
    t.integer "episode_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "video_footage_id"
    t.datetime "expiry_date", null: false
    t.float "price", default: 0.0, null: false
    t.string "video_quality", default: "HD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "id"], name: "index_purchases_on_user_id_and_id", unique: true
    t.index ["user_id"], name: "index_purchases_on_user_id"
    t.index ["video_footage_id"], name: "index_purchases_on_video_footage_id"
  end

  create_table "purchases_coupons", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.bigint "coupon_id", null: false
    t.index ["coupon_id"], name: "index_purchases_coupons_on_coupon_id"
    t.index ["purchase_id", "coupon_id"], name: "index_purchases_coupons_on_purchase_id_and_coupon_id", unique: true
    t.index ["purchase_id"], name: "index_purchases_coupons_on_purchase_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "video_footages", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.text "plot", null: false
    t.integer "season_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type"], name: "index_video_footages_on_type"
  end

  add_foreign_key "activity_logs", "users"
  add_foreign_key "episodes", "video_footages", column: "season_id"
  add_foreign_key "purchases", "users"
  add_foreign_key "purchases_coupons", "coupons"
  add_foreign_key "purchases_coupons", "purchases"
end
