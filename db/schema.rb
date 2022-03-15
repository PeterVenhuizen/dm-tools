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

ActiveRecord::Schema[7.0].define(version: 2022_03_13_151738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "monsters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "species"
    t.string "armor_class"
    t.integer "hit_points"
    t.string "challenge_rating", default: "0"
    t.string "alignment"
    t.string "hit_dice"
    t.hstore "ability_scores", default: {"wisdom"=>"10", "charisma"=>"10", "strength"=>"10", "dexterity"=>"10", "constitution"=>"10", "intelligence"=>"10"}
    t.integer "xp"
    t.integer "proficiency_bonus", default: 2
    t.hstore "speed", default: {"fly"=>"0", "swim"=>"0", "walk"=>"0", "climb"=>"0", "burrow"=>"0"}
    t.string "languages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
