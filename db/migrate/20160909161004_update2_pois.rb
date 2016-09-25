class Update2Pois < ActiveRecord::Migration[5.0]
  def change
		add_column :pois, :cap, :integer
		add_column :pois, :voltePreferito, :integer
  end
end
