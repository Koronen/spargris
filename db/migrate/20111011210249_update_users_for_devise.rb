class UpdateUsersForDevise < ActiveRecord::Migration
  def self.up
    rename_column :users, :crypted_password, :encrypted_password

    add_column :users, :remember_token, :string
    add_column :users, :remember_created_at, :datetime

    remove_column :users, :username
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :perishable_token
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :last_request_at
    remove_column :users, :current_login_at
    remove_column :users, :last_login_at
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_ip
  end

  def self.down
    rename_column :users, :encrypted_password, :crypted_password

    remove_column :users, :remember_created_at
    remove_column :users, :remember_token

    add_column :users, :username, :string, :null => false
    add_column :users, :password_salt, :string, :null => false
    add_column :users, :persistence_token, :string, :null => false
    add_column :users, :perishable_token, :string, :null => false
    add_column :users, :login_count, :integer, :null => false, :default => 0
    add_column :users, :failed_login_count, :integer, :null => false, :default => 0
    add_column :users, :last_request_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_ip, :string
    add_column :users, :last_login_ip, :string
  end
end
