class ChangeRateIntoFloatForPois < ActiveRecord::Migration[5.0]
  def change
	change_column :pois, :rate,  :float
  end
end
