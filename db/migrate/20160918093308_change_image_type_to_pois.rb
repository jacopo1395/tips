class ChangeImageTypeToPois < ActiveRecord::Migration[5.0]
  def change
  	change_column :pois, :image,  :text
  end
end
