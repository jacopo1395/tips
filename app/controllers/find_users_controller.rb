class FindUsersController < ApplicationController	

	def index
		@users = User.where("username LIKE ? ", "%#{params[:user]}%").or(User.where("email LIKE ? ", "%#{params[:user]}%"))

	end
	
	def new
		#store all the users that match the name searched
		@users = User.where("name LIKE ? ", "%#{params[:user]}%")  
		
	end
end
