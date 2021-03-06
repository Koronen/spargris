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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111011210249) do

  create_table "budget_items", :force => true do |t|
    t.integer  "budget_id",      :default => 0,   :null => false
    t.integer  "budget_post_id", :default => 0,   :null => false
    t.float    "amount",         :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budget_posts", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.integer  "parent_id",   :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     :default => 0,  :null => false
    t.string   "description", :default => "", :null => false
  end

  create_table "budgets", :force => true do |t|
    t.datetime "starts_at",                 :null => false
    t.datetime "ends_at",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :default => 0, :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "transaction_items", :force => true do |t|
    t.integer  "transaction_id", :default => 0,   :null => false
    t.integer  "budget_post_id", :default => 0,   :null => false
    t.float    "amount",         :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",    :default => "",  :null => false
  end

  create_table "transactions", :force => true do |t|
    t.datetime "timestamp",   :default => '1970-01-01 00:00:00', :null => false
    t.string   "description", :default => "",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     :default => 0,                     :null => false
    t.integer  "vendor_id",   :default => 0,                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "",                    :null => false
    t.string   "encrypted_password",  :default => "",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone",           :default => "",                    :null => false
    t.string   "language",            :default => "",                    :null => false
    t.string   "remember_token",      :default => "",                    :null => false
    t.datetime "remember_created_at", :default => '1970-01-01 00:00:00', :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :default => 0,  :null => false
  end

end
