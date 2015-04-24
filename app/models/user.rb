class User < ActiveRecord::Base
	#before saving the user's email, 
	#transform it to all lowercase so the lookup is easier
	before_save { email.downcase! }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :username, presence: true, 
						 length: { maximum: 50 }

	validates :email, presence: true, 
					  length: { maximum: 255 }, 
					  format: { with: VALID_EMAIL_REGEX }, 
					  uniqueness: { case_sensitive: false }


	# This is where ruby adds two more columns to the model
	# password and password_confirm
	# it also adds a password_digest to the table in the database to store the hash of the password
	has_secure_password	


	validates :password, length: {minimum: 6}
end
