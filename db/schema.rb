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

ActiveRecord::Schema.define(version: 2021_02_17_051855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challengers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "original_show", null: false
    t.integer "total_seasons"
    t.integer "total_wins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drafts", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_drafts_on_league_id"
    t.index ["season_id"], name: "index_drafts_on_season_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "epsidoe_name", null: false
    t.datetime "air_date", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "league_managers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_managers_on_league_id"
    t.index ["user_id"], name: "index_league_managers_on_user_id"
  end

  create_table "league_teams", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_teams_on_league_id"
    t.index ["team_id"], name: "index_league_teams_on_team_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.integer "season_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_challengers", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "challenger_id", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenger_id"], name: "index_team_challengers_on_challenger_id"
    t.index ["team_id"], name: "index_team_challengers_on_team_id"
  end

  create_table "team_ownerships", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "team_id"], name: "index_team_ownerships_on_owner_id_and_team_id", unique: true
    t.index ["team_id"], name: "index_team_ownerships_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name", null: false
    t.integer "wins"
    t.integer "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
