class IndexStudentUpn < ActiveRecord::Migration
  def self.up
    add_index :students, :upn
  end

  def self.down
  end
end
