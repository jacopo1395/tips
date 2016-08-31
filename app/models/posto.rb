class Posto < ApplicationRecord
	require "http"
	
	
	def initialize(key)
		@api_key=key
	end
	
	def spot(lat,long)
		@query=nearby+'key='+@api_key+"&location="+lat+","+long+"&radius=500"
		#location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key
		@places=HTTP.get(@query)
		@var=ActiveSupport::JSON.decode(@places)
	end
	
	
	def spot(lat,long,radius)
		@query=nearby+'key='+@api_key+"&location="+lat+","+long+"&radius="+radius
		#location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key
		@places=HTTP.get(@query)
		@var=ActiveSupport::JSON.decode(@places)
	end
	

	
	
	
	private
	
	def nearby
		"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
	end
	
	def textseach
	"https://maps.googleapis.com/maps/api/place/textsearch/json?"
	end
	
end
