class CreateExclusions < ActiveRecord::Migration
  def self.up
    create_table :exclusions do |t|
      t.integer :student_id
      t.integer :length
      t.date :date
      t.string :effective_dates
      t.string :reason
      t.timestamps
    end
  end

  def self.down
    drop_table :exclusions
  end
end
