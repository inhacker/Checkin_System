class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
    	t.string :username
    	t.string :password
    	t.string :email

     	t.timestamps
    end
  end

  def self.dow
  	drop_table :users
  end
end
