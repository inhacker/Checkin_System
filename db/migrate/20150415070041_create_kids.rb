class CreateKids < ActiveRecord::Migration
  def up
    create_table :kids do |t|
		t.string :f_name
		t.string :m_name
		t.string :l_name

		t.string :guid
		t.datetime :dob
		t.datetime :first_date_attended
    #t.string :Data.parse(dob)
		t.boolean :is_checked_in

		# t.column :gender, "ENUM('male', 'female')"
		# t.column :class, "ENUM('infant','walker', 'toddler','first_grade', 'second_grade', 'third_grade', 'forth_grade', 'fifth_grade')"

		t.timestamps
    end
  end

  def down
  	drop_table :kids
  end
end
