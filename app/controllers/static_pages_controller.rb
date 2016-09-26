class StaticPagesController < ApplicationController
  require "http"

  before_filter :delete_previous_search_data
  after_action :save_location, only: [:home]

  def home
  	@pois={}
  	@pois[:recent]  = Poi.order(updated_at: :desc).limit(5)
  	@pois[:popular] = Poi.order(:voltePreferito).first(5)

    ##chiamata api
    res= HTTP.get("https://maps.googleapis.com/maps/api/browserlocation/json?browser=chromium&sensor=true")
    res_parsed = JSON.parse(res)
    if res_parsed["status"]=="OK"
      @lat=res_parsed["location"]["lat"]
      @long=res_parsed["location"]["lng"]
  	else
      @lat=request.location.latitude
      @long=request.location.longitude
    end

    cap = HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?latlng="+@lat.to_s+","+@long.to_s+"&key=AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")#attenzione alla key
    cap_parsed = JSON.parse(cap)
    if cap_parsed["status"]=="OK"
      cap_parsed["results"][0]["address_components"].each do |x|
        if x["types"][0] == "postal_code"
          @var=x["long_name"].to_i
        end
      end
    end
    @pois[:nearbyPopular] = Poi.where("cap = ?", @var).order(:voltePreferito).first(5)

    @pois
  end

  def my_profile
    @my_pois={}
    
    f=Final_result.where(:user_id => current_user.id)
    @my_pois[:all]=Array.new
    f.each do |i|
      @my_pois[:all].push(Pois.find(i[:PoisId]))
    end

    @my_pois
  end

  def profile
    @my_pois={}
    @user = User.find(params[:id])
    f=Final_result.where(:user_id => @user.id)
    @my_pois[:all]=Array.new
    f.each do |i|
      @my_pois[:all].push(Poi.find(i[:PoisId]))
    end

    @my_pois
  end

  def list_users
	  @users = User.where("username LIKE ? ", "%#{params[:user]}%").or(User.where("email LIKE ? ", "%#{params[:user]}%"))
  end

  def find_users
  end

  def add_favourite
    if(!check(params[:id]))
      f=Is_favourite.new(:userMail=>current_user.email,:PoisId=>params[:id])
      f.save
    end
    redirect_to :controller =>'pois', :action => 'show', :id=>params[:id]
  end

  def remove_favourite
    if(check(params[:id]))
      f=Is_favourite.where("userMail = ? AND PoisId = ?",current_user.email,params[:id]).destroy_all
    end
    redirect_to :controller =>'pois', :action => 'show', :id=>params[:id]
  end

  def check(id)
    f=Is_favourite.where("userMail = ? AND PoisId = ?",current_user.email,id)
    if(!f.empty?)
      true
    else
      false
    end
  end

  private
    def delete_previous_search_data
      session[:search_object] = nil
      session[:question_object] = nil
    end

    def save_location
      session[:lat]=@lat
      session[:long]=@long
    end
end
