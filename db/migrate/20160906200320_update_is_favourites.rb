class UpdateIsFavourites < ActiveRecord::Migration[5.0]
  def change
  	remove_column :is_favourites, :apiId
  	remove_column :is_favourites, :api
  	add_column :is_favourites, :PoisId, :integer
  end
end
