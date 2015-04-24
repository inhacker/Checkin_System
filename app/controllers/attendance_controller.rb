class AttendanceController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

	def index
		@attendances = Attendance.all;
		debugger
	end
	
	
	def show
	end

	# POST /attendance
	# POST /attendance.json
	def create
		@attendance = Attendance.new(attendance_params)
	end

	def edit
	end

	# GET /attendance/new
	def new 
		@attendance = Attendance.new
	end

	def update
		 respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@attendance.destroy
		respond_to do |format|
			format.html { redirect_to kid_index_path, notice: 'Kid was successfully destroyed.' }
      			format.json { head :no_content } 
		end
	end

private
	def set_attendance
		@attendance = Attendance.find(params[:id])
	end
	def attendance_params
		params.require(:date, :kid_id)
	end
end
