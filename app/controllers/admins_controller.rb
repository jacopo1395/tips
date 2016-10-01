class AdminsController < ApplicationController
	before_filter :authenticate_user!, only: [:new_admin, :create_admin]
	
	def show
	end 
	
	# GET /new_admin
	def new_admin
		if current_user.try(:admin?)
			render "new_admin"
			 #@user = User.new
		else
			render "denied"
		end
	end
	  
	# POST /create_admin
	def create_admin
		if current_user.try(:admin?)		
			@user=User.find_by  email: user_params
			if @user == nil 
				 render "error"
				 return
			end 
			if params[:add] 
				@user.update_attribute :admin, true				
				render "create_admin"
			else
				@user.update_attribute :admin, false
				render "delete_admin"
			end
		end
	end
	
	
	  
	# GET /admin
	def admin
		render "success"
		current_user.update_attribute( :admin, true)  
	end
	  
	private
	
	def user_params
      params[:users][:email]
    end

end
