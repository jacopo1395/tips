class SearchesController < ApplicationController

  include SearchesHelper

  before_filter :load_search
  after_filter :save_search

  def search
    if params[:clear] == "true"
      @search = nil
      return
    end

    # If @search is nil, create a Search object and ask the first question
    if @search.nil?
      latitude = request.location.latitude
      longitude = request.location.longitude
      @search = Search.new(latitude, longitude)
    else
      # Do something
    end
  end

  private
    def load_search
      @search = session[:search_object]
    end

    def save_search
      session[:search_object] = @search
    end

end
