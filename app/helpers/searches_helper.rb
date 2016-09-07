module SearchesHelper

  class SearchResults

    require "http"

    attr_accessor :places_by_type
    attr_accessor :place_types_by_number
    attr_accessor :place_top_types

    PLACE_TYPES = %w[
      amusement_park
      aquarium
      art_gallery
      bakery
      bar
      book_store
      bowling_alley
      cafe
      church
      clothing_store
      convenience_store
      department_store
      electronics_store
      establishment
      library
      meal_takeaway
      mosque
      movie_theater
      museum
      night_club
      park
      restaurant
      shoe_store
      shopping_mall
      spa
      store
      synagogue
      zoo
    ]

    PLACE_TYPES_TEST = %w[
      bar
      movie_theater
      museum
      park
      restaurant
    ]

    # Place types not supported by Google Places APIs
    # Should be written in ITALIAN
    PLACE_ADDITIONAL_TYPES = %w[
      pasticceria
      pub
    ]

    PLACE_ADDITIONAL_TYPES_TEST = %w[
      pasticceria
    ]

    def initialize(latitude, longitude)
      @places_by_type = Hash.new

      # Google Places API key
      @api_key = "AIzaSyBHJpb9fD5eBeN-wd0Xq0vYkTUtRSEgr0U"

      # Provide default coordinates to use for development
      if Rails.env.development?
        # Colosseum (Rome) coordinates
        @latitude = 41.89015
        @longitude = 12.49244
      else
        # Geocoder (gem) gets user's coordinates from his IP address
        @latitude = latitude
        @longitude = longitude
      end

      # Set default radius
      @radius = 500

      get_places_by_type
      get_place_types_by_number @places_by_type
      get_top_types
    end

    def get_top_types(limit = 4)
      @place_top_types = @place_types_by_number.sort_by { |type, quantity| -1*quantity }
      @place_top_types = @place_top_types[0..3]
    end

    def remove_places_by_type(*types_to_remove)
      @places_by_type.except!(*types_to_remove)
      @place_types_by_number.except!(*types_to_remove)
      get_top_types
    end

    def keep_places_by_type(*types_to_keep)
      @places_by_type.slice!(*types_to_keep)
      @place_types_by_number.slice!(*types_to_keep)
      get_top_types
    end

    ### Private methods ###

    private

      def build_nearby_query(options = {})
        # Base url
        query = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
        # Add location (latitude and longitude)
        query += "location=#{@latitude},#{@longitude}"
        # If a radius value is specified, add it. Otherwise default to 500.
        if !options[:radius].nil?
          query += "&radius=#{options[:radius]}"
        else
          query += "&radius=500"
        end
        # If a type value is specified, add it.
        if !options[:type].blank?
          query += "&type=#{options[:type]}"
        end
        # If a name value is specified, add it.
        if !options[:name].blank?
          query += "&name=#{options[:name]}"
        end
        # If a keyword is specified, add it.
        if !options[:keyword].blank?
          query += "&keyword=#{options[:keyword]}"
        end
        # If a previous request returned a next page token, add it.
        if !options[:next_page_token].blank?
          query += "&pagetoken=#{options[:next_page_token]}"
        end
        # Add API key
        query += "&key=#{@api_key}"

        return query
      end

      def get_places_by_type(options = { max_pages: 1 })
        @places_by_type = Hash.new

        if Rails.env.development?
          # Minimize api calls during development
          place_types = PLACE_TYPES_TEST
          place_additional_types = PLACE_ADDITIONAL_TYPES_TEST
        else
          place_types = PLACE_TYPES
          place_additional_types = PLACE_ADDITIONAL_TYPES
        end

        place_types.each do |place_type|

          query = build_nearby_query(type: place_type)
          http_string_result = HTTP.get(query).to_s

          page_number = 0
          http_parsed_result = Array.new
          http_parsed_result[page_number] = JSON.parse(http_string_result)

          @places_by_type[place_type] = http_parsed_result[page_number]["results"]

          next_page_token = http_parsed_result[page_number]["next_page_token"]
          page_number += 1

          while (!next_page_token.blank? && page_number < options[:max_pages]) do
            http_string_result = build_nearby_query(next_page_token: next_page_token)
            http_string_result = HTTP.get(query).to_s
            http_parsed_result[page_number] = JSON.parse(http_string_result)

            @places_by_type[place_type].concat(http_parsed_result[page_number]["results"])

            next_page_token = http_parsed_result[page_number]["next_page_token"]
            page_number += 1
          end
        end

        place_additional_types.each do |place_type|
          query = build_nearby_query(keyword: place_type)
          http_string_result = HTTP.get(query).to_s

          page_number = 0
          http_parsed_result = Array.new
          http_parsed_result[page_number] = JSON.parse(http_string_result)

          @places_by_type[place_type] = http_parsed_result[page_number]["results"]

          next_page_token = http_parsed_result[page_number]["next_page_token"]
          page_number += 1

          while (!next_page_token.blank? && page_number < options[:max_pages]) do
            http_string_result = build_nearby_query(next_page_token: next_page_token)
            http_string_result = HTTP.get(query).to_s
            http_parsed_result[page_number] = JSON.parse(http_string_result)

            @places_by_type[place_type].concat(http_parsed_result[page_number]["results"])

            next_page_token = http_parsed_result[page_number]["next_page_token"]
            page_number += 1
          end
        end
      end

      def get_place_types_by_number(places_by_type)
        @place_types_by_number = Hash.new
        @places_by_type.each do |type, places|
          @place_types_by_number[type.to_s] = places.length
        end
      end
  end
end
