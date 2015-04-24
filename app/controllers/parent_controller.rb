class ParentController < ApplicationController
  def index
    @parents = Parent.all
  end

  def show
		@parent = Parent.find(params[:id])
  end

  def new
    @parent = Parent.new
    if params[:kid_in_progress]
      @kid_in_progress = params[:kid_in_progress]
    else
      @kid_in_progress = false
    end  
  end

	def edit
		@parent = Parent.find(params[:id])
	end

  def create
    @parent = Parent.new(parent_params)
    @kid_in_progress=params[:kid_in_progress]
    
      if @parent.save
        
        if @kid_in_progress == "true"
          
          redirect_to new_kid_path
        else   
          render "parents"
        end
        
      else
        render "new"
        
      end
  
  end

  # PATCH/PUT /parent/1
  # PATCH/PUT /parent/1.json
  def update
		@parent = Parent.find(params[:id])
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent/1
  # DELETE /parent/1.json
  def destroy
		@parent = Parent.find(params[:id])
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to '/parent', notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #this method will search the database
  #and finds all the parents that fit the
  #query in their name
  def find_by_name
    query = '%'+params[:query]+'%'

    parents_found = Parent.where("f_name LIKE ? OR l_name LIKE ? OR CONCAT(f_name,' ',l_name) LIKE ?", query, query, query)
    render json: parents_found
  end

  #this method will return all the kids
  #that belong to this parent
  def get_all_kids
    render json: Parent.find(params[:id]).kids
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    def parent_params
      params.require(:parent).permit(:f_name, :m_name, :l_name, :guid, :email, :kid_in_progress)
    end
end
