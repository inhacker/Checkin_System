class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
    	t.belongs_to :parent, index: true

    	t.string :street
    	t.string :apt
    	t.string :city
    	t.string :state
    	t.string :zipcode
    	
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
