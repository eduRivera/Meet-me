class AddAttributsUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :pwd, :string
  	add_column :users, :email, :string
  end
end
