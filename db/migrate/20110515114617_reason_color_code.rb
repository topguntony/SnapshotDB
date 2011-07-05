class ReasonColorCode < ActiveRecord::Migration
  def self.up
    add_column :reasons, :color, :string, :default => '000000'
  end

  def self.down
    remove_column :reasons, :color
  end
end
