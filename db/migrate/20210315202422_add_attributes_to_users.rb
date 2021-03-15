class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :text
    add_column :users, :name, :text
    add_column :users, :phone, :text
    add_column :users, :country, :text
    add_column :users, :city, :text
    add_column :users, :bio, :text
  end
end
