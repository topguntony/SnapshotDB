class CreateStaffs < ActiveRecord::Migration
  def self.up
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :salutation
      t.boolean :referrer
      t.timestamps
    end
  end

  def self.down
    drop_table :staffs
  end
end
