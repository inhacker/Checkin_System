class CreatePhoneBooks < ActiveRecord::Migration
  def self.up
    create_table :phone_books do |t|
    	t.belongs_to :parent, index: true
    	
    	t.string :phone_number
      	t.timestamps
    end
  end

  def self.down
  	drop_table :phone_books
  end
end
