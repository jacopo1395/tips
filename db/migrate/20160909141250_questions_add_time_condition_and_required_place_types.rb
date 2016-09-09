class QuestionsAddTimeConditionAndRequiredPlaceTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :time_condition, :text
    add_column :questions, :required_place_types, :text
  end
end
