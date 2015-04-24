=begin
  This controller is used for login purpose

  * Create :
  ----------------
  The create method gets a Email and Password and then checks that agains the database
  the magic is done by the authenticate function which I didnt write :)
	=> Read https://github.com/codahale/bcrypt-ruby
	=> Read http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password


  then if you are logged in successfully, it will first set the sesion variable so that in the next HTTP request we can still tell if
  the user is logged in.
	=> Read http://guides.rubyonrails.org/security.html
	=> the log_in function is defined in app/controllers/helpers/users_helper.rb

  it will also reroute you somewhere, the location is temporary for now if not, 
  it also sets the flash variable to be shown on the page

  * Destroy :
  ----------------
  The destroy method simply deletes the session variable and removes the profile the current user


  * New :
  ---------------
  Its only serving the page
  
=end

class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to "/"
		else
			flash[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		log_out
		redirect_to "/login"
	end
end
