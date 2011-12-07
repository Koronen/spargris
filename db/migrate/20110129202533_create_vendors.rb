class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name, :null => false, :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
