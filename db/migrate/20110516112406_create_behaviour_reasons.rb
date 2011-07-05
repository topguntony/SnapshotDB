class CreateBehaviourReasons < ActiveRecord::Migration
  def self.up
    create_table :behaviour_reasons do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :behaviour_reasons
  end
end
