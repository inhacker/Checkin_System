class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
    	t.belongs_to :kid, index: true
    	t.belongs_to :parent, index: true

    	t.boolean :is_primary
      t.timestamps
    end
  end

  def self.down
  	drop_table :families
  end
end
