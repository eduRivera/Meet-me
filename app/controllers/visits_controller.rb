class VisitsController < ApplicationController

	before_filter :load_url
	
	def index
		@location
   	    @visits = @location.visits.where(:from_date => DateTime.now.beginning_of_month..DateTime.now.end_of_month)
	end

	def show
		@visit = Visit.find(params[:id])
		render plain: "You try to cheat", status: 404 if @visit.location_id != params[:location_id].to_i
	rescue ActiveRecord::RecordNotFound
		render plain: 'Sorry, not found', status: 404
	end

	def create

		@visit = @location.visits.new visit_params
		 if @visit.save
      		redirect_to action: 'index', controller:'visits'
    	else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      		@visit
      		render "new"
    	end
	end

	def new 
		@allLocations = Location.all
		@visit = @location.visits.new
	end 

	def destroy
		@location = Location.find(params[:location_id])
		@visit = @location.visits.find(params[:id])
     
      if @visit.destroy()
      	 flash[:notice]="the visit has been delete"
         redirect_to action: 'index', controller:'visits', :notice => "the visit has been delete"
      else
      	 flash[:notice]="tha visit hasn't been delete"
         redirect_to action: 'index', controller:'visits', :notice => "tha visit hasn't been delete"
      end
	end

	def edit
		@location = Location.find(params[:location_id])
		@visit = @location.visits.find(params[:id])
	end

	def update
       @location = Location.find(params[:location_id])
	   @visit = @location.visits.find(params[:id])
      	
       if @visit.update visit_params
         redirect_to location_visits_path(@location)
       else
         render "edit"
       end
	end

	private

	def load_url
		if (params[:user_id])
			@location = User.find(params[:user_id])
		end
		if (params[:location_id])
			@location = Location.find(params[:location_id])
		end
	end

	def visit_params
		params.require(:visit).permit(:user_name, :from_date, :to_date)
	end

end
