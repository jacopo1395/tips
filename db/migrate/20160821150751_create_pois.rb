class CreatePois < ActiveRecord::Migration[5.0]
  def change
    create_table :pois do |t|
      t.string :name
      t.string :type
      t.string :address
      t.integer :rate
      t.integer :price
      t.string :map
      t.string :image
      t.text :review
      t.string :api

      t.timestamps
    end
  end
end
