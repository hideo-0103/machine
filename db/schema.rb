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

ActiveRecord::Schema.define(version: 20200121112351) do

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.integer  "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_images_on_machine_id", using: :btree
  end

  create_table "machines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines_parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "machine_id"
    t.integer  "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machines_parts_on_machine_id", using: :btree
    t.index ["part_id"], name: "index_machines_parts_on_part_id", using: :btree
  end

  create_table "machines_repairs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "machine_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "repair_id_id"
    t.integer  "repair_id"
    t.index ["machine_id"], name: "index_machines_repairs_on_machine_id", using: :btree
    t.index ["repair_id"], name: "index_machines_repairs_on_repair_id", using: :btree
    t.index ["repair_id_id"], name: "index_machines_repairs_on_repair_id_id", using: :btree
  end

  create_table "parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "quentity",      default: 0, null: false
    t.integer  "replenishment", default: 0, null: false
    t.integer  "result",        default: 0, null: false
  end

  create_table "parts_repairs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "part_id"
    t.integer  "repair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_parts_repairs_on_part_id", using: :btree
    t.index ["repair_id"], name: "index_parts_repairs_on_repair_id", using: :btree
  end

  create_table "records_pdfs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "machine_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "text",       limit: 4294967295
    t.index ["machine_id"], name: "index_repairs_on_machine_id", using: :btree
    t.index ["user_id"], name: "index_repairs_on_user_id", using: :btree
  end

  create_table "use_parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "parts_id"
    t.integer  "quentity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parts_id"], name: "index_use_parts_on_parts_id", using: :btree
  end

  create_table "user_repairs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "repair_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repair_id"], name: "index_user_repairs_on_repair_id", using: :btree
    t.index ["user_id"], name: "index_user_repairs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "images", "machines"
  add_foreign_key "machines_parts", "machines"
  add_foreign_key "machines_parts", "parts"
  add_foreign_key "machines_repairs", "machines"
  add_foreign_key "machines_repairs", "repairs"
  add_foreign_key "parts_repairs", "parts"
  add_foreign_key "parts_repairs", "repairs"
  add_foreign_key "repairs", "machines"
  add_foreign_key "repairs", "users"
  add_foreign_key "use_parts", "parts", column: "parts_id"
  add_foreign_key "user_repairs", "repairs"
  add_foreign_key "user_repairs", "users"
end
