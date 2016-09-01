class SearchesController < ApplicationController

	def index	
	
	#@location=Geokit::Geocoders::MultiGeocoder.geocode('12.215.42.19')
	#@location = Geokit::Geocoders::MultiGeocoder.geocode("80.183.119.115")
	#render plain: @location
		@p=Api.new("80.183.119.115")
		@var=@p.nearby()
		#@var=@p.nearby({:name => "vegetariano", :type => "restaurant"})
		#@var=@p.text_search("ristoranti roma vegani")
		render plain: @var  
	 end
end
