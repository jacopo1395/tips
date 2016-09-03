module SearchesHelper

  class Search

    def initialize
      @client = GooglePlaces::Client.new("AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U")
    end

  end


end
