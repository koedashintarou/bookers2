class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.string :book
      t.integer :_id

      t.timestamps
    end
  end
end
