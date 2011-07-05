class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.date :date
      t.string :period
      t.integer :reason_id
      t.integer :student_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
