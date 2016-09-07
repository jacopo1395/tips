class UpdateIsRecents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :is_recents, :apiId1
  	remove_column :is_recents, :apiId2
  	remove_column :is_recents, :apiId3
  	remove_column :is_recents, :apiId4
  	remove_column :is_recents, :apiId5
  	remove_column :is_recents, :api1
  	remove_column :is_recents, :api2
  	remove_column :is_recents, :api3
  	remove_column :is_recents, :api4
  	remove_column :is_recents, :api5

  	add_column :is_recents, :PoisId1, :integer
    add_column :is_recents, :PoisId2, :integer
    add_column :is_recents, :PoisId3, :integer
    add_column :is_recents, :PoisId4, :integer
    add_column :is_recents, :PoisId5, :integer
  end
end
