class SearchesController < ApplicationController

<<<<<<< HEAD
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
      @search = SearchResults.new(latitude, longitude)
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

=======
	def index	
	
	
	#  @p=Api.new(request.remote_ip)
	@p=Api.new("80.183.119.115")
		#@var=@p.nearby()
		@var=@p.nearby({:name => "vegetariano", :type => "restaurant"})
		#@var=@p.text_search("ristoranti roma vegani")
		render plain: @var
	 end
>>>>>>> dev
end
