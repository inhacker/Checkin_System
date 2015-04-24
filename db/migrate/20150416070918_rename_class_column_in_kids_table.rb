class RenameClassColumnInKidsTable < ActiveRecord::Migration
  def self.up
  	rename_column :kids, :class, :group
  end

  def self.down
  	rename_column :kids, :group, :class
  end
end
