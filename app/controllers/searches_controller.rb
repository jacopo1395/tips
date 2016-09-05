class SearchesController < ApplicationController

  include SearchesHelper

  def new

    @search = SearchResults.new(request.location.latitude, request.location.longitude)

    to_render = ""
    to_render += @search.place_types_by_number.to_s
    to_render += "<br><br><br>"
    to_render += @search.place_top_types.to_s
    to_render += "<br><br><br>"
    to_render += @search.places_by_type.to_s

    render html: to_render.html_safe
  end

end
