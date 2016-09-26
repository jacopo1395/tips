class ChangeTypeToFinalResults < ActiveRecord::Migration[5.0]
  def change
  	rename_column :final_results, :SearchId,  :user_id
  end
end
