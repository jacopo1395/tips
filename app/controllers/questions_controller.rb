class QuestionsController < ApplicationController

	before_filter :load_data
	after_filter :save_data
	before_action :is_admin?, only: [:index, :show, :new, :edit, :create, :update, :destroy]

	require "http"

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(article_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end


	def final_quest
	end

	def retry_final_quest
	end

	# GET /final_filter
	def final_filter
		@pois= []
		precedent=@search.clone
		@search.places_by_type.each do |type, places|
			places.each do |place|
				if place["rating"].to_f < params[:rating].to_f
					places.delete(place)
				end
				if place["price"].to_f > params[:price].to_f
					places.delete(place)
				end
				if distanza(place["geometry"]["location"]["lat"].to_f,place["geometry"]["location"]["lng"].to_f) < params[:distance].to_f*10
					places.delete(place)
				end
			end
		end

		@search.places_by_type.each do |type, places|
			places.each do |place|
				@pois.push(toObject(place,type))
			end
		end
		if @pois.empty?
			@search=precedent
			save_data
			redirect_to retry_final_quest_path
		else
			redirect_to final_result_path(:id => 0)
		end
	end

	#GET /final_result/:id
	def final_result
		i=0
		@search.places_by_type.each do |type, places|
			places.each do |place|
				if(i==params[:id].to_i)
					if Poi.exists?(apiId: place["place_id"] )
						@poi=Poi.find_by apiId: place["place_id"]
						@poi.increment!(:voltePreferito)
					else
						@poi=toObject(place,type)
						details(place["place_id"])
						@poi.update_attributes(:voltePreferito => 1)
						@poi.save
					end

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
						f=Final_result.new(:user_id => current_user.id,:PoisId => @poi.id)
						f.save
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
		poi[:apiId]=place["place_id"]
		if place["formatted_phone_number"]!=nil
			poi[:phone]=place["formatted_phone_number"]
		end
		if place["website"]!=nil
			place[:website]=place["website"]
		end
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
    	#render html: http_response_parsed
    	#return
    	i=0
    	img=[]
    	http_response_parsed["result"]["photos"].each do |photo|
    		img[i]= photo["photo_reference"].to_s
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


    def question_params
      params.require(:question).permit(:text, :options, :string_id, :time_condition, :required_place_types, :additional_place_types, :place_types_to_keep)
    end

    def is_admin?
    	if (user_signed_in? && current_user.admin==true)
    		true
    	else
    		render 'static_pages/denied'
    		return false
    	end
    end

end
