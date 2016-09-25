class SearchesController < ApplicationController

  before_filter :load_data
  after_filter :save_data

  def search
    if params[:clear] == "true"
      @search = nil
      @question = nil
    end

    # If @search is nil, create a Search object and ask the first question
    if @search.nil?
      latitude = @lat
      longitude = @long
      @search = Search.new(latitude, longitude)
      @question = Question.find_by!(string_id: Question::FIRST_QUESTION_ID)
      @question.check_options_conditions(@search)
    elsif !params[:next_question_id].nil?
      # Do something
      @question = Question.find_by!(string_id: params[:next_question_id])
      @search.keep_places_by_type(@question.place_types_to_keep) if !@question.place_types_to_keep.nil?
      if @question.options.nil?
        redirect_to '/final_quest'
      else
        @search.add_new_places_by_keyword(@question.additional_place_types) if !@question.additional_place_types.nil?
        @question.check_options_conditions(@search)
      end
    end
  end

  def general_question
  end

  def final_result
    
  end

  private
    def load_data
      @search = session[:search_object]
      @question = session[:question_object]
      @lat= session[:lat]
      @long =session[:long]
    end

    def save_data
      session[:search_object] = @search
      session[:question_object] = @question
    end
end
