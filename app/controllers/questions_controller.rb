class QuestionsController < ApplicationController
	 before_filter :load_data
 	 after_filter :save_data

	
	def final_quest
	end
	
	def final_filter
		@search = session[:search_object]
		@search.each do |type|
			type.each do |place|
				if place.rating < params[:ranking]
					type.delete(place)
				end
			end
		end
	end
	
	
	private
    def load_data
      @search = session[:search_object]
      @question = session[:question_object]
    end

    def save_data
      session[:search_object] = @search
      session[:question_object] = @question
    end
end
