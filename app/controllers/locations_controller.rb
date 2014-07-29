class LocationsController < ApplicationController

	def index
		# @locations = Location.last_created(7)
		@locations = Location.all
		@items = [1,2,3,4]
	end

	def show
		@location = Location.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		render plain: 'Sorry, not found', status: 404 unless @location
	end

	def new 
		@location = Location.new
		2.times { @location.comments.build}
	end 

	def create
		@location = Location.new location_params
		
		 if @location.save
		 	@location.reload.comments
      		redirect_to action: 'index', controller:'locations'
    	 else
      		@location
      		render "new"
    	 end
	end

	def edit
		@location = Location.find(params[:id])
		2.times { @location.comments.build }

	end

	def update
       @location = Location.find(params[:id])
      	
       if @location.update location_params
       	 @location.reload.comments
         redirect_to action: 'index', controller:'locations'
       else
         render "edit"
       end
	end

	def destroy
		@location = Location.find(params[:id])
     
      if @location.destroy()
         redirect_to action: 'index', controller:'locations', :notice => "the visit has been delete"
      else
         redirect_to action: 'index', controller:'locations', :notice => "tha visit hasn't been delete"
      end
	end

	private

	def location_params
		params.require(:location).permit(:name, :city, :country, comments_attributes: [:id, :description, :_destroy])
	end
	
end