module SearchesHelper

  class SearchResults

    attr_accessor :location

    def initialize
      @client = GooglePlaces::Client.new("AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")
      @location = Geokit::Geocoders::MultiGeocoder.geocode("12.215.42.19")
    end

  end
end