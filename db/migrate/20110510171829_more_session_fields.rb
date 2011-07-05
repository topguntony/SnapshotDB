class MoreSessionFields < ActiveRecord::Migration
  def self.up
    add_column :sessions, :staff_id, :integer
    add_column :sessions, :subject_id, :integer
    add_column :sessions, :referrer_id, :integer
  end

  def self.down
  end
end
