class CreateParents < ActiveRecord::Migration
  def self.up
    create_table :parents do |t|
		t.string :f_name
		t.string :m_name
		t.string :l_name

		t.string :guid
		t.string :email

  		t.timestamps
    end
  end

  def self.down
 		drop_table :parents
  end
end
