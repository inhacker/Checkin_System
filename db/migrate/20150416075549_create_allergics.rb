class CreateAllergics < ActiveRecord::Migration
  def self.up
    create_table :allergics do |t|
    	t.belongs_to :kid, index: true
    	t.belongs_to :allergy, index: true

    	t.text :comment
      	t.timestamps
    end
  end

  def self.down
  	drop_table :allergics
  end
end
