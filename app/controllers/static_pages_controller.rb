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
    poi=nil
    @my_pois[:recent] =Array.new

    is_recent= Is_recent.find_by userMail: current_user.email
    if !is_recent.nil?
      n=is_recent[:PoisId1].to_i
      if(n!=nil && n!=0 && n!="")
        p=Poi.find(n)

        if (p!=nil)
          poi =p
          @my_pois[:recent][0]= poi
        end
      end

      n=is_recent[:PoisId2].to_i
      if(n!=nil && n!=0 && n!="")
        p=Poi.find(n)
        if (p!=nil)
          poi =p
          @my_pois[:recent][1]= poi
        end
      end

      n=is_recent[:PoisId3].to_i
      if(n!=nil && n!=0 && n!="")
        p=Poi.find(n)
        if (p!=nil)
          poi =p
          @my_pois[:recent][2]= poi
        end
      end

      n=is_recent[:PoisId4].to_i
      if(n!=nil && n!=0 && n!="")
        p=Poi.find(n)
        if (p!=nil)
          poi =p
          @my_pois[:recent][3]= poi
        end
      end

      n=is_recent[:PoisId5].to_i
      if(n!=nil && n!=0 && n!="")
        p=Poi.find(n)
        if (p!=nil)
          poi =p
          @my_pois[:recent][4]= poi
        end
      end
    end

    f=Final_result.where(:user_id => current_user.id)
    @my_pois[:all]=Array.new
    f.each do |i|
      @my_pois[:all].push(Pois.find(i[:PoisId]))
    end

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
