class FamiliesController < ApplicationController
	before_action :set_family, only: [:show, :edit, :update, :destroy]

	def index
		@families = Family.all
	end

	def show
	end

	def new
		@family = Family.new
	end
	
	def edit
	end

	def create
		@family = Family.new(family_params)
    respond_to do |format|
		  if @family.save
		    format.html { redirect_to @family, notice: ' was successfully created.' }
		    format.json { render :show, status: :created, location: @family }
		  else
		    format.html { render :new }
		    format.json { render json: @family.errors, status: :unprocessable_entity }
		  end
    end
	end

	def update
    respond_to do |format|
      if @family.update(kid_params)
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to kid_index_path, notice: 'Family was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

private
	def set_family
		@family = Family.find(params[:id])
	end

  # Never trust parameters from the scary internet, only allow the white list through.
  def family_params
  	params.require(:family, :parent_id, :kid_id, :is_primary)
  end
end
