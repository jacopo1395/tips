class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :number
      t.integer :range
      t.float :lat
      t.float :long
      t.string :user

      t.timestamps
    end
  end
end
