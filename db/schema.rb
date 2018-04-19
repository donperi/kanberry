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

ActiveRecord::Schema.define(version: 2018_04_16_165448) do

  create_table "attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.text "meta"
    t.integer "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "board_id"
    t.integer "source_id"
    t.integer "external_id"
    t.integer "priority"
    t.integer "type_id"
    t.integer "status_id"
    t.integer "assigned_to"
    t.integer "created_by"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories_tags", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.bigint "tag_id", null: false
    t.index ["story_id"], name: "index_stories_tags_on_story_id"
    t.index ["tag_id"], name: "index_stories_tags_on_tag_id"
  end

  create_table "story_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "story_id"
    t.text "text", null: false
    t.index ["story_id"], name: "index_story_comments_on_story_id"
  end

  create_table "story_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "name"
    t.integer "story_id"
    t.integer "status"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_tasks_on_story_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "password_digest"
    t.string "avatar"
    t.boolean "enabled"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
