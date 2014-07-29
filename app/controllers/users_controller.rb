class UsersController < ApplicationController

	def index 
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		render plain: 'Sorry, not found', status: 404 unless @user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		
		 if @user.save
      		redirect_to action: 'index', controller:'users'
    	 else
      		@user
      		render "new"
    	 end
	end

	def edit
		@user = User.find(params[:id])
	end


	def update
       @user = User.find(params[:id])
      	
       if @user.update user_params
         redirect_to action: 'index', controller:'users'
       else
         render "edit"
       end
	end

	def destroy
		@user = User.find(params[:id])
     
      if @user.destroy()
         redirect_to action: 'index', controller:'users', :notice => "the visit has been delete"
      else
         redirect_to action: 'index', controller:'users', :notice => "tha visit hasn't been delete"
      end
	end

	def user_params
		params.require(:user).permit(:name, :email, :pwd)
	end
end
