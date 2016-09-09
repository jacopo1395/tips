class Update2Questions < ActiveRecord::Migration[5.0]
  def change
  		remove_column :questions, :questionId
		remove_column :questions, :searchNumber
     	remove_column :questions, :userMail
     	remove_column :questions, :answer
  end
end
