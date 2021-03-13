class AddNameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :name, :text
  end
end
