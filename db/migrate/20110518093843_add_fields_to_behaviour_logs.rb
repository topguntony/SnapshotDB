class AddFieldsToBehaviourLogs < ActiveRecord::Migration
  def self.up
    add_column :behaviour_logs, :period, :string
    add_column :behaviour_logs, :location_id, :integer
  end

  def self.down
  end
end
