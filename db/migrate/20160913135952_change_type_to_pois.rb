class ChangeTypeToPois < ActiveRecord::Migration[5.0]
  def change
	rename_column :pois, :type,  :types
  end
end
