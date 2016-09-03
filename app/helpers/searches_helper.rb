module SearchesHelper

  class SearchResults

    attr_accessor :location

    def initialize(remote_ip)
      @client = GooglePlaces::Client.new("AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")
      @location = Geokit::Geocoders::MultiGeocoder.geocode(remote_ip)
    end

  end
end
