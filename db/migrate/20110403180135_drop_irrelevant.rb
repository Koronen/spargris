class DropIrrelevant < ActiveRecord::Migration
  def self.up
    drop_table :accounts
    drop_table :locations
  end

  def self.down
    create_table "accounts", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "user_id"
    end

    create_table "locations", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
