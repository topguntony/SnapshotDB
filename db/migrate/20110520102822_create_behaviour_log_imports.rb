class CreateBehaviourLogImports < ActiveRecord::Migration
  def self.up
    create_table :behaviour_log_imports do |t|
      t.timestamps
    end
    add_column :behaviour_logs, :behaviour_log_import_id, :integer
  end

  def self.down
    drop_table :behaviour_log_imports
  end
end
