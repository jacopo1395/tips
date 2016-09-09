class CreateIsRecents < ActiveRecord::Migration[5.0]
  def change
    create_table :is_recents do |t|
      t.string :userMail

      t.string :apiId1
      t.string :api1
      t.string :apiId2
      t.string :api2
      t.string :apiId3
      t.string :api3
      t.string :apiId4
      t.string :api4
      t.string :apiId5
      t.string :api5
      t.integer :last


      t.timestamps
    end
  end
end
