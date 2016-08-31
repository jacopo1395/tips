class Api < ApplicationRecord
	require "http"
	
	#inizializza la libreria | key = chiave fornita dalla api
	def initialize(key)
		@api_key=key
	end	
	
	# nearby chiama le API nearby di google
	# parametri obbligatori, stringhe: 1) latitudine, 2)longitudine
	# parametro opzionale, stringa: 3) radius -di default = 500 
	# parametro opzionale: 4) hash con chiave e valore -chiave ammesse :name e :type  NOTA perusare il 4 parametro è obbligatorio usare anche il terzo
	## ESEMPI   nearby("11111","22222")     nearby("11111","22222","50")     nearby("11111","22222","50", {:name => "vegetariano", :type => "restaurant"}) ##
	# ritorno: un array di POI
	def nearby(*args)
		case args.size
		when 2
			nearby2(args[0],args[1])
		when 3
			nearby3(args[0],args[1],args[2])
		when 4
			nearby4(args[0],args[1],args[2],args[3])
		end
	end
	
	
	# imposta radius a 500
	def nearby2(lat,long)
		nearby3(lat,long,"500")
	end
	
	# imposta radius a 500
	def nearby3(lat,long,radius)
		nearby4(lat,long,radius,{})
	end
	
	
	#
	def nearby4(lat,long,radius,options)
		query=nearby_s+'key='+@api_key+"&location="+lat+","+long+"&radius="+radius+"&language=it"
		if options.has_key?(:type)
			query=query+"&type="+options[:type]
		end
		if options.has_key?(:name)
			query=query+"&name="+options[:name]
		end
		#location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key
		places=HTTP.get(query)
		var=ActiveSupport::JSON.decode(places)["results"]
		a=Array.new
		var.each do |x|
		poi=Poi.new(:name => x["name"], 
					#:types => x["types"], 
					:address => x["vicinity"],
					:rate => x["rating"].to_i,
					#:lat => var[i]["geometry"]["location"]["lat"], 
					#:long => var[i]["geometry"]["location"]["lng"] 
					)
	
		#poi.save
			s=""
			i=0
			x["types"].each do |y|
				if i==0 
					s=s+""+y
				else 
					s=s+","+y
				end
				i=i+1
			end
			poi[:types]=s
			a.push(poi)
			i=i+1
		end
		a	
	end
	



	# text_search nearby chiama le API text_search di google
	# WORKING IN PROGRESS...
	def text_search(query)
		q=textseach_s+'key='+@api_key+"&query="+query
		#location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key
		places=HTTP.get(q)
		var=ActiveSupport::JSON.decode(places)["results"]
		a=Array.new
		var.each do |x|
		poi=Poi.new(:name => x["name"], 
					#:types => x["types"], 
					:address => x["vicinity"],
					:rate => x["rating"],
					#:lat => var[i]["geometry"]["location"]["lat"], 
					#:long => var[i]["geometry"]["location"]["lng"] 
					)
	
		#poi.save
			s=""
			i=0
			x["types"].each do |y|
				if i==0 
					s=s+""+y
				else 
					s=s+","+y
				end
				i=i+1
			end
			poi[:types]=s
			a.push(poi)
			i=i+1
		end
		a	
	end
	
	#
	private
	
	def nearby_s
		"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
	end
	
	def textseach_s
		"https://maps.googleapis.com/maps/api/place/textsearch/json?"
	end
	
end
