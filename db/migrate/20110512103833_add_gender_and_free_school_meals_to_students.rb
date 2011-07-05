class AddGenderAndFreeSchoolMealsToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :gender, :string
    add_column :students, :free_school_meals, :boolean
    add_index :students, :gender
    add_index :students, :free_school_meals
  end

  def self.down
    remove_column :students, :gender
    remove_column :students, :free_school_meals
  end
end
