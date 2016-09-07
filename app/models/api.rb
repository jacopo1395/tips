class Api < ApplicationRecord
	acts_as_mappable :default_units => :km
	
	require "http"
	
	
	# GUIDA
	# p=Api.new(request.remote_ip)
	# p.nearby(<your params>)
	# p.text_search("<your query>")
	
	
	#inizializza la libreria. E geolocalizza il client tramite l'ip
	# ESEMPIO  @p=Api.new(request.remote_ip)
	def initialize(ip)
		@api_key="AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U"
		location = Geokit::Geocoders::MultiGeocoder.geocode(ip)
		if location.success
			@lat=location.lat.to_s
			@long=location.lng.to_s
		else 
			@lat="0"
			@long="0"
		end
	end
	
	# nearby chiama le API nearby di google
	# con 0 parametri: prende le coordinate dall'ip, imposta radius a 500 e non utilizza altre opzioni
	# con 1 parametro hash: prende le coordinate dall'ip, imposta radius a 500 e utilizza le opzioni passate nell'hash
	# con 2 parametri string, string: prende latitudine e longitudine passate come stringhe, imposta radius a 500 e non utilizza altre opzioni
	# con 3 parametri string, string, string: prende latitudine e longitudine e radius passate come stringhe, non utilizza altre opzioni
	# con 4 parametri string, string, string, hash: imposta latitudine, longitudine e radius dalle stringhe passate e imposta le altre opzioni dall'hash passato
	## ESEMPI p.nearby()  p.nearby({:type => "restaurant"})  @p.nearby("11111","22222")    
	##  p.nearby("11111","22222","50")    p.nearby("11111","22222","50", {:name => "vegetariano", :type => "restaurant"}) ##
	# ritorno: un array di POI
	def nearby(*args)
		case args.size
		when 0
			magic_nearby({})
		when 1
			magic_nearby(args[0])
		when 2
			nearby2(args[0],args[1])
		when 3
			nearby3(args[0],args[1],args[2])
		when 4
			nearby4(args[0],args[1],args[2],args[3])
		end
	end
	
	
#############  Nel caso in cui si volesse utilizzare una specifica funzione  #####################
	
	# trova latitudine e longitudine dall'IP, imposta radius a 500
	def magic_nearby(options)		
		nearby4(@lat,@long,"500",options)
	end
	
	# imposta radius a 500
	def nearby2(lat,long)
		nearby3(lat,long,"500")
	end
	
	# chiamata alle api google senza opzioni
	def nearby3(lat,long,radius)
		nearby4(lat,long,radius,{})
	end
	
	
	# se si vogliono specificare tutti e 4 i parametri
	def nearby4(lat,long,radius,options)
		query=nearby_s+'key='+@api_key+"&location="+lat+","+long+"&radius="+radius+"&language=it"
		options.each do |k,v|
			query=query+"&"+k.to_s+"="+v.to_s
		end
		#(:type)
		#	query=query+"&type="+options[:type]
		#end
		#if options.has_key?(:name)
		#	query=query+"&name="+options[:name]
		#end
		#location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key
		places=HTTP.get(query)
		var=ActiveSupport::JSON.decode(places)["results"]
		a=Array.new
		var.each do |x|
		poi=Poi.new(:name => x["name"],  
					:address => x["vicinity"],
					:rate => x["rating"].to_i,
					#:lat => var[i]["geometry"]["location"]["lat"], 
					#:long => var[i]["geometry"]["location"]["lng"], 
					#aggiungere gli altri parametri appena mattia aggiorna il db
					)

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
#####################################################



	# text_search chiama le API text_search di google
	# paraentro stringa: query di ricerca
	# ESEMPIO text_search("ristoranti vegani roma")
	# ritorno: array di POI
	def text_search(query)
		q=textseach_s+'key='+@api_key+"&query="+formatt(query)+"&language=it"
		#location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key
		places=HTTP.get(q)
		var=ActiveSupport::JSON.decode(places)["results"]
		a=Array.new
		var.each do |x|
		poi=Poi.new(:name => x["name"],  
					:address => x["formatted_address"],
					:rate => x["rating"],
					#:lat => var[i]["geometry"]["location"]["lat"], 
					#:long => var[i]["geometry"]["location"]["lng"]
					#aggiungere gli altri parametri appena mattia aggiorna il db 
					)
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


	
	# Private
	private
	
	def formatt(string)
		s=""
		i=0
		string.split(' ').each do |x|
			if i==0 
				s=s+x
			else 
				s=s+"+"+x
			end
			i=1
		end
		s
	end
	
	def nearby_s
		"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
	end
	
	def textseach_s
		"https://maps.googleapis.com/maps/api/place/textsearch/json?"
	end
	
end
