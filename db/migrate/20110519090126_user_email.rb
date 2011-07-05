class UserEmail < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :login_count, :integer
    add_column :users, :failed_login_count, :integer
    add_column :users, :current_login_ip, :string
    add_column :users, :last_login_ip, :string
    add_column :users, :last_login_at, :datetime
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_ip
    remove_column :users, :last_login_at
  end
end
