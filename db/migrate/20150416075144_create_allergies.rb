class CreateAllergies < ActiveRecord::Migration
  def self.up
    create_table :allergies do |t|
    	t.string :name
    	t.text :description
    	t.string :medicine

      	t.timestamps
    end
  end


  def self.down
  	drop_table :allergies
  end
end
