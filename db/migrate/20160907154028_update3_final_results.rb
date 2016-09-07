class Update3FinalResults < ActiveRecord::Migration[5.0]
  def change
	remove_column :final_results, :StringId	

  	add_column :final_results, :SearchId, :integer
  end
end
