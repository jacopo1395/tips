class Update2FinalResults < ActiveRecord::Migration[5.0]
  def change
  	remove_column :final_results, :userMail
  	remove_column :final_results, :searchNumber	

  	
  	add_column :final_results, :StringId, :integer
  end
end
