class StaticPagesController < ApplicationController
  require "http"

  before_filter :delete_previous_search_data
  after_action :save_location, only: [:home]

  def home
  	@pois={}
  	@pois[:recent] = Poi.order(updated_at: :desc).limit(4)
  	#@pois[:popular] += Poi.order(updated_at: :desc).limit(5)
    res= HTTP.get("https://maps.googleapis.com/maps/api/browserlocation/json?browser=chromium&sensor=true")
    res_parsed = JSON.parse(res)
    if res_parsed["status"]=="OK"
      @lat=res_parsed["location"]["lat"]
      @long=res_parsed["location"]["lng"]
  	else
      @lat=request.location.latitude
      @long=request.location.longitude
    end
    @pois
  end

  def my_profile
      #@pois[:popular] += Poi.order(updated_at: :desc).limit(5)
    res= HTTP.get("https://maps.googleapis.com/maps/api/browserlocation/json?browser=chromium&sensor=true")
    res_parsed = JSON.parse(res)
    
    @lat=res_parsed["location"]["lat"]
    @long=res_parsed["location"]["lng"]
  end

  def profile
    @user = User.find(params[:id])
  end

  def list_users
	  @users = User.where("username LIKE ? ", "%#{params[:user]}%").or(User.where("email LIKE ? ", "%#{params[:user]}%"))
  end

  def find_users
  end

  def add_favourite
    if(!check(params[:id]))
      f=Is_favourite.new(:userMail=>current_user.email,:id=>params[:id])
      f.save
    end
  end

  def remove_favourite
    if(check(params[:id]))
      f=Is_favourite.where("userMail = ? AND PoisId = ?",current_user.email,params[:id])
      f.delete
    end
  end

  def check(id)
    f=Is_favourite.where("userMail = ? AND PoisId = ?",current_user.email,id)
    if(!f==nil)
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
