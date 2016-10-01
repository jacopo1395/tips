class QuestionsChangeNextQuestionsType < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :next_questions, :text
  end
end
