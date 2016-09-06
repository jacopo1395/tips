class CreateFinalResults < ActiveRecord::Migration[5.0]
  def change
    create_table :final_results do |t|
      t.string :userMail
      t.integer :searchNumber
      t.string :apiId
      t.string :api

      t.timestamps
    end
  end
end
