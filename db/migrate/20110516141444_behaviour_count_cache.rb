class BehaviourCountCache < ActiveRecord::Migration
  def self.up
    add_column :students, :behaviour_logs_count, :integer
  end

  def self.down
  end
end
