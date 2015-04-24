class KidController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy, :edit_parents]

  # GET /kids
  # GET /kids.json
  def index
    @kids = Kid.all
  end

  # GET /kids/1
  # GET /kids/1.json
  def show
  end

  # GET /kids/new
  def new
    @kid = Kid.new
  end

  # GET /kids/1/edit
  def edit
    @kid = Kid.find(params[:id])
  end

	# GET /kid/1/edit_parent
	def edit_parents

	end

	def change_primary_parent
		#update the primary parent to the newly passed parent id

		current_pm_p = Family.find_by(is_primary: true);
		current_pm_p.is_primary = false
	
		#hope that this works
		current_pm_p.save

		new_pm_p = Family.find_by(parent_id: params[:parent_id], kid_id: params[:id])
		new_pm_p.is_primary = true

		response = {}

		if new_pm_p.save
			response[:status] = "saved"
		else
			reposene[:status] = "failed"
		end

		render json: response
	end

	def add_parent
		new_pm_p = Family.create(parent_id: params[:parent_id], kid_id: params[:id], is_primary: false)

		response = {}

		if new_pm_p.save
			response[:status] = "saved"
		else
			response[:status] = "failed"
		end

		render json: response
	end

  # POST /kids
  # POST /kids.json
  def create

    @kid_params_two=kid_params
    @kid_params_two[:dob]=DateTime.parse(@kid_params_two["dob"])
    @kid_params_two[:first_date_attended]=DateTime.parse(@kid_params_two[:first_date_attended])
    

	  @kid = Kid.new(@kid_params_two)
		@parent = Parent.find(params[:parent])
		@allergy = Allergy.find(params[:allergy])

    respond_to do |format|
		  if @kid.save
		    format.html { redirect_to @kid, notice: 'Kid was successfully created.' }
		    format.json { render :show, status: :created, location: @kid }
		  else
		    format.html { render :new }
		    format.json { render json: @kid.errors, status: :unprocessable_entity }
		  end
			Family.create(:kid => @kid, :parent => @parent)
			Allergic.create(:kid => @kid, :allergy => @allergy)
    end
  end

  # PATCH/PUT /kids/1
  # PATCH/PUT /kids/1.json
  def update
    #debugger
    @kid_params_two=kid_params
    @kid_params_two[:dob]=DateTime.parse(@kid_params_two["dob"])
    @kid_params_two[:first_date_attended]=DateTime.parse(@kid_params_two[:first_date_attended])
    
    
    respond_to do |format|
      if @kid.update(@kid_params_two)
        format.html { redirect_to @kid, notice: 'Kid was successfully updated.' }
        format.json { render :show, status: :ok, location: @kid }
      else
        format.html { render :edit }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1
  # DELETE /kids/1.json
  def destroy
    @kid.destroy
    respond_to do |format|
      format.html { redirect_to kid_index_path, notice: 'Kid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkin
    ids = params[:ids]
    successfulCheckins = 0
    now = DateTime.parse(Date.today.to_s)
    
    ids.each do |id|
      kid = Kid.find(id)
      kid.is_checked_in = true
      Attendance.create(:date => now, :kid_id => id)
      successfulCheckins+=1 if kid.save
    end

    render json: successfulCheckins
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kid
      @kid = Kid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kid_params
	  	params.require(:kid).permit(:f_name, :m_name, :l_name, :guid, :dob, :first_date_attended, :is_checked_in, :gender, :group, :parent, :allergy, :utf8, :authenticity_token, :commit)
    end
end
