class QuestionsRemoveNextQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :next_questions
  end
end
