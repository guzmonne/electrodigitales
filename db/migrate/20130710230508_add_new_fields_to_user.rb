class AddNewFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :text
  	add_column :users, :phone, :text
  	add_column :users, :cellphone, :text
  	add_column :users, :address, :text
	end
end
