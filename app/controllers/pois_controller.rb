class PoisController < ApplicationController
	
	#DEBUG questa funzione è solo per prova
	#GET /pois
	def index
		@pois=Poi.all
	end
	
	# GET pois/:id
	def show
		@pois = Poi.find(params[:id])
	end
	
	#DEBUG crea un nuvo poi. questa funzione è solo per prova
	# GET /nuovo
	def nuovo
		p=Poi.new(:name => "prova")
		p.save()
	end
	
	
end
