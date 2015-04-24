class OtherQueriesController < ApplicationController
  def index
    @kids = Kid.all
    @kids_checked_in = []
    @attendances = Attendance.all

    @kids.each do |kid|
      if kid.is_checked_in == "true"
        @kids_checked_in.push(kid)
      end
    end

  end

  def new
  end

  def group
  end

end
