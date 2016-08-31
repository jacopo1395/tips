class CreatePostos < ActiveRecord::Migration[5.0]
  def change
    create_table :postos do |t|

      t.timestamps
    end
  end
end
