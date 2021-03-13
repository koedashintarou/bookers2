class AddEmailToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :email, :text
  end
end
