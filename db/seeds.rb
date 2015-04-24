# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Kid.delete_all
Parent.delete_all
Family.delete_all
Allergy.delete_all
Allergic.delete_all
Attendance.delete_all

kid_a = Kid.create(:f_name => "Nima", :l_name => "Esmaili", :gender => :male, :guid => 23)
kid_b = Kid.create(:f_name => "Amber", :m_name => "Nicole", :l_name => "Lott", :gender => :female, :guid => 24)
kid_c = Kid.create(:f_name => "Brian", :m_name => "Andrew", :l_name => "Cooksey", :gender => :male, :guid => 25)

parent_a = Parent.create(:f_name => "Brian", :m_name => "Andrew", :l_name => "Cooksey", :guid => 5)
parent_b = Parent.create(:f_name => "Nima", :l_name => "Esmaili", :guid => 4)
parent_c = Parent.create(:f_name => "Amber", :m_name => "Nicole", :l_name => "Lott", :guid => 2)
parent_d = Parent.create(:f_name => "Diwen", :m_name => "Stephen", :l_name => "Hu", :guid => 6)

allergy_a = Allergy.create(:name => "", :description => "", :medicine => "")
allergy_b = Allergy.create(:name => "Peanut Butter", :description => "Swelling", :medicine => "Epi-Pen")
allergy_c = Allergy.create(:name => "Pollen", :description => "Sniffling", :medicine => "Zyrtec")

Family.create(:parent_id => parent_a.id, :kid_id => kid_a.id, :is_primary => true)
Family.create(:parent_id => parent_a.id, :kid_id => kid_b.id, :is_primary => false)
Family.create(:parent_id => parent_b.id, :kid_id => kid_b.id, :is_primary => true)
Family.create(:parent_id => parent_c.id, :kid_id => kid_c.id, :is_primary => true)
Family.create(:parent_id => parent_d.id, :kid_id => kid_c.id, :is_primary => false)

Allergic.create(:allergy_id => allergy_a.id, :kid_id => kid_a.id, :comment => "Not Severe")
Allergic.create(:allergy_id => allergy_a.id, :kid_id => kid_b.id, :comment => "Super Severe")

#Attendance.create(:kid_id => kid_a.id, :date => (DateTime.strptime("2000-04-21", "%m-%d-%Y")))
#Attendance.create(:kid_id => kid_a.id, :date => (DateTime.strptime("2000-04-22", "%m-%d-%Y")))
#Attendance.create(:kid_id => kid_b.id, :date => (DateTime.strptime("2000-04-22", "%m-%d-%Y")))
#Attendance.create(:kid_id => kid_c.id, :date => (DateTime.strptime("2000-04-23", "%m-%d-%Y")))

