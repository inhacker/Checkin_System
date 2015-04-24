class Parent < ActiveRecord::Base
	has_many :families
	has_many :kids, :through => :families

	has_many :addresses
	has_many :phone_books
end
