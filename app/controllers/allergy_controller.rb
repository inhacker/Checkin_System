class AllergyController < ApplicationController
 
  def edit
    @allergy=Allergy.find(params[:id])
  end

  def index
    @allergies= Allergy.all
    
  end

  def new
    @allergy=Allergy.new
    if params[:kid_in_progress]
      @kid_in_progress=params[:kid_in_progress]
    else
      @kid_in_progress=false;
    end
    
  end

  def show
    @allergy= Allergy.find(params[:id])
  end
  
          
  def create
    @allergy = Allergy.new(allergy_params)
    @kid = Kid.find(params[:kid])
    
    @kid_in_progress=params[:kid_in_progress]
    
      if @allergy.save
        if@kid_in_progress == "true"
          redirect_to new_kid_path
        else
        redirect_to(:action => 'index')
        end
      else
        render('new')
      end
      Allergic.create(:kid=> @kid, :allergy => @allergy)  
  end
  
  # PATCH/PUT /allergy/1
  # PATCH/PUT /allergy/1.json
  def update
		@allergy = Allergy.find(params[:id])
    respond_to do |format|
      if @allergy.update(allergy_params)
        format.html { redirect_to @allergy, notice: 'Allergy was successfully updated.' }
        format.json { render :show, status: :ok, location: @allergy }
      else
        format.html { render :edit }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # DELETE /allergy/1
  # DELETE /allergy/1.json
  def destroy
		@allergy = Allergy.find(params[:id])
    @allergy.destroy
    respond_to do |format|
      format.html { redirect_to '/allergy', notice: 'Allergy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  
  
  private
  
  def allergy_params
    params.require(:allergy).permit(:name, :description, :medicine)
  end
  
  
  
end
