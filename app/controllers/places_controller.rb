class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  require "http"

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
	
	 @p=Posto.new("AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")
	 @var=@p.spot("41.8917929","12.550459700000033","50")
	 render plain: @var["results"][1]
   # @places=HTTP.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.8917929,12.550459700000033&radius=50&type=restaurant&key=AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U	")
	#@var=ActiveSupport::JSON.decode(@places)
	#render plain: @var["results"][0]["types"][0]
	
	#if @place.save
    #  render plain: @place
    #else
    #  render 'new'
    #end
 
	
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.fetch(:place, {})
    end
end
