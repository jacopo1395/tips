class QuestionsController < ApplicationController

	before_filter :load_data
	after_filter :save_data

	require "http"

	def final_quest
	end

	def final_filter
		@pois= []
		@search.places_by_type.each do |type, places|
			places.each do |place|
				if place["rating"].to_f < params[:rating].to_f
					places.delete(place)
				end
				if place["price"].to_f > params[:price].to_f
					places.delete(place)
				end
				if distanza(place["geometry"]["location"]["lat"].to_f,place["geometry"]["location"]["lng"].to_f) > params[:distance].to_f
					places.delete(place)
				end
			end
		end
		
		@search.places_by_type.each do |type, places|
			places.each do |place|				
				@pois.push(toObject(place,type))
			end
		end
	@pois
	end

	def final_result
		i=0
		@search.places_by_type.each do |type, places|
			places.each do |place|
				if(i==params[:id].to_i)
					@poi=toObject(place,type)
					details(place["place_id"])
					@poi.save
					if user_signed_in?
						rec=Is_recent.find_by userMail: current_user.email
						if rec[:last]==0 
							options={ :PoisId1 => @poi.id , :last => 1}							
						end
						if rec[:last]==1 
							options={ :PoisId2 => @poi.id , :last => 2}								
						end
						if rec[:last]==2 
							options={ :PoisId3 => @poi.id , :last => 3}	
						end
						if rec[:last]==3 
							options={ :PoisId4 => @poi.id , :last => 4}	
						end
						if rec[:last]==4 
							options={ :PoisId5 => @poi.id , :last => 0}	
						end
						rec.update_attributes (options)
					end
					
					redirect_to @poi				
				end
				i=i+1
			end
		end
		
	end
	

	private
    def load_data
      @search = session[:search_object]
      @lat= session[:lat]
      @long =session[:long]
    end

    def save_data
      session[:search_object] = @search
    end

    def pitagora(x,y)
    	Math.sqrt((x ** 2) + (y ** 2))
    end

    def distanza2punti(x1,y1,x2,y2)
    	pitagora(x2-x1,y2-y1)
    end

    def distanza(x,y)
    	distanza2punti(@lat.to_f,
    					x,
    					@long.to_f,
    					y)
    end

    def toObject(place,type)
    	query="https://maps.googleapis.com/maps/api/place/photo?maxwidth=600" 
    	poi=Poi.new
		poi[:name]=place["name"]
		poi[:types]=type
		poi[:lat]=place["geometry"]["location"]["lat"]
		poi[:long]=place["geometry"]["location"]["lng"]
		poi[:price]=place["price_level"]
		poi[:rate]=place["rating"]
		poi[:address]=place["vicinity"]
		if(place["photos"]!=nil)
			id = place["photos"][0]["photo_reference"]					
			res_string= HTTP.get(query+"&photoreference="+id+"&key=AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U").to_s
			res_string=res_string.split("HREF=\"")[1]
			res_string=res_string.split("\">here")[0]
			poi[:image][0]=res_string
		else
			poi[:image][0]="http://portfoliotheme.org/enigmatic/wp-content/uploads/sites/9/2012/07/placeholder1.jpg"
		end
		return poi
    end 

    def details(placeid)
    	query="https://maps.googleapis.com/maps/api/place/details/json?language=it"
    	http_response= HTTP.get(query+"&placeid="+placeid+"&key=AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")
    	http_response_parsed=JSON.parse(http_response)
    	#render plain: http_response_parsed
    	#return
    	i=0
    	img=[]
    	http_response_parsed.each do |photo|
    		img[i]= http_response_parsed["result"]["photos"][i]["photo_reference"].to_s 
    		i+=1
    	end
    	query2="https://maps.googleapis.com/maps/api/place/photo?maxwidth=600" 
    	i=0
    	img.each do |id|				
			res_string= HTTP.get(query2+"&photoreference="+id+"&key=AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U").to_s
			res_string=res_string.split("HREF=\"")[1]
			res_string=res_string.split("\">here")[0]
			@poi[:image][i]=res_string
			i+=1
		end
		i=0
		http_response_parsed["result"]["reviews"].each do |rev|
			if rev==nil 
				return 
			end
			review = { :author => rev["author_name"], :rating => rev["rating"], :text => rev["text"]}
			@poi[:review][i]=review
			i += 1
		end
		
    end
end
