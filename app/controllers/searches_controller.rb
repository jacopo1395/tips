class SearchesController < ApplicationController

	def index	
	
	
	#  @p=Api.new(request.remote_ip)
	@p=Api.new("80.183.119.115")
		#@var=@p.nearby()
		@var=@p.nearby({:name => "vegetariano", :type => "restaurant"})
		#@var=@p.text_search("ristoranti roma vegani")
		render plain: @var
	 end
end
