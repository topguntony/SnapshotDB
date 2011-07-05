class CreateYearGroups < ActiveRecord::Migration
  def self.up
    create_table :year_groups do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :year_groups
  end
end
