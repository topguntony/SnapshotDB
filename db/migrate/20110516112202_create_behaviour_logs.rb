class CreateBehaviourLogs < ActiveRecord::Migration
  def self.up
    create_table :behaviour_logs do |t|
      t.integer :student_id
      t.integer :behaviour_reason_id
      t.integer :behaviour_outcome_id
      t.integer :staff_id
      t.date :date
      t.timestamps
    end
  end

  def self.down
    drop_table :behaviour_logs
  end
end
