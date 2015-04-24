class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save

      # This is a helper function that 
      # sets a session variable that we can later
      # check to see if the user is logged in or not
      # when someone creates a user, they automatically
      # get logged in

      # Read app/controllers/helpers/users_helper.rb
      log_in(@user)
      
      # this is a value that we check in the main application.html
      # which is the main layout so if there is am message, we 
      # can show it.
      flash[:success] = 'Welcome . . . '

      #redirect to the user page
  		redirect_to @user

  	else
  		render 'new'
  	end
  end

  private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end	
end
