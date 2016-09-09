class UpdatePois < ActiveRecord::Migration[5.0]
  
	def change
  
		add_column :pois, :apiId, :string
		add_column :pois, :lat, :float

		add_column :pois, :long, :float
	end

end
