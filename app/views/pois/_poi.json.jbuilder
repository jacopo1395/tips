json.extract! poi, :id, :name, :types, :address, :rate, :price, :map, :image, :review, :api, :apiId, :lat, :long, :created_at, :updated_at
json.url poi_url(poi, format: :json)