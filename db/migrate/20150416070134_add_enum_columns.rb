class AddEnumColumns < ActiveRecord::Migration
  def self.up

  	add_column :kids, :gender, :integer, default: 0
  	add_column :kids, :class, :integer, default: 0

  end

  def self.down

	remove_column :kids, :gender, :integer, default: 0
  	remove_column :kids, :class, :integer, default: 0

  end
end
