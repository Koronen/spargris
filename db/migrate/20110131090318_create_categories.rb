class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :null => false, :default => ""
      t.integer :parent_id, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
