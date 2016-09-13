class QuestionsAddAdditionalPlaceTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :additional_place_types, :text
    add_column :questions, :place_types_to_keep, :text
  end
end
