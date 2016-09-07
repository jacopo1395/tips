class CreateIsFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :is_favourites do |t|
      t.string :userMail
      t.string :apiId
      t.string :api

      t.timestamps
    end
  end
end
