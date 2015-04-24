class Kid < ActiveRecord::Base
	has_many :families
	has_many :parents, :through => :families

	has_many :attendances
	has_many :allergics
	has_many :allergies, :through => :allergics

	enum gender: [ :male, :female ]
	enum group: [:infant, :walker, :toddler, :first_grade, :second_grade, :third_grade, :forth_grade, :fifth_grade]
end
