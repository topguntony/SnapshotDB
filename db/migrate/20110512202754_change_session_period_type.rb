class ChangeSessionPeriodType < ActiveRecord::Migration
  def self.up
    remove_column :sessions, :period
    add_column :sessions, :period, :integer
  end

  def self.down
  end
end
