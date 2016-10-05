class AddAttToPois < ActiveRecord::Migration[5.0]
  def change
  	add_column :pois, :website, :string
  	add_column :pois, :phone, :string
  end
end
