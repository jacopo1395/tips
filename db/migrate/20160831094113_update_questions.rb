class UpdateQuestions < ActiveRecord::Migration[5.0]
  
	def change
		add_column :questions, :questionId, :integer
		add_column :questions, :searchNumber, :integer
     	add_column :questions, :userMail, :string

  	end

end
