class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :upn
      t.string :first_name
      t.string :last_name
      t.integer :year_group_id
      t.integer :house_id
      t.integer :ethnicity_id
      t.date :dob
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
