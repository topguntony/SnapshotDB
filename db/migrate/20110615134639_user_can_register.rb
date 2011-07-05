class UserCanRegister < ActiveRecord::Migration
  def self.up
    add_column :users, :can_register, :boolean, :default => false
  end

  def self.down
  end
end
