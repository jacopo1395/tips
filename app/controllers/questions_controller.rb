class QuestionsController < ApplicationController

	before_filter :load_data
	after_filter :save_data

	def final_quest
	end

	def final_filter
		@search.places_by_type.each do |type, places|
			places.each do |place|
				if place["rating"].to_f < params[:rating].to_f
					places.delete(place)
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
