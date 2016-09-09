class AddNextQuestionsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :next_questions, :string
    add_column :questions, :string_id, :string
  end
end
