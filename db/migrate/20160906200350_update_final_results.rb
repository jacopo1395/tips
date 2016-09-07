class UpdateFinalResults < ActiveRecord::Migration[5.0]
  def change
  	remove_column :final_results, :apiId
  	remove_column :final_results, :api
  	
  	add_column :final_results, :PoisId, :integer
  end
end
