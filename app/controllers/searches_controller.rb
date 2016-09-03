class SearchesController < ApplicationController

  include SearchesHelper

  def new
    # @client = GooglePlaces::Client.new("AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")
    # # spot_list = @client.spots(41.89015, 12.49244)
    # spot_list = @client.spots(41.89015, 12.49244, :types => ['restaurant','food'], :radius => 1000)
    #
    # spot_names = Array.new
    # spot_list.each do |spot|
    #   spot_names.push spot.name
    #   spot_names.push spot.vicinity
    #   spot_names.push spot.rating
    #   spot_names.push spot.types
    # end
    #
    # render html: ("Hello, Google Places!<br><br> #{spot_names}").html_safe

    @search = SearchResults.new(request.remote_ip)

    render html: "Ciao! #{request.remote_ip} #{@search.location}"
  end

end
