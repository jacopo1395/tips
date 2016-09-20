class StaticPagesController < ApplicationController
  require "http"

  before_filter :delete_previous_search_data
  after_action :save_location, only: [:home]

  def home
  	@pois={}
  	@pois[:recent] = Poi.order(updated_at: :desc).limit(5)
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
    @my_pois={}
    poi=nil
    is_recent= Is_recent.find_by userMail: current_user.email
    n=is_recent[:PoisId1].to_i
    if(n!=nil && n!=0 && n!="")
      p=Poi.find(n)
    end
    if (p!=nil)
      poi =p
    end
    #poi+=Poi.find(is_recent[:PoisId2].to_i)
    #poi+=Poi.find(is_recent[:PoisId3].to_i)
    #poi+=Poi.find(is_recent[:PoisId4].to_i)
    #poi+=Poi.find(is_recent[:PoisId5].to_i)
    @my_pois[:recent] = poi
    @my_pois
  end

  def profile
    @user = User.find(params[:id])
  end

  def list_users
	  @users = User.where("username LIKE ? ", "%#{params[:user]}%").or(User.where("email LIKE ? ", "%#{params[:user]}%"))
  end

  def find_users
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
