class TempController < ApplicationController
  def index
  	redirect_to login_path if !logged_in?
  	
  	@kids = Kid.all
  end

  def resource
  	@kids = Kid.all
  	render :json => {kids: @kids}, status: :ok
  end
end
