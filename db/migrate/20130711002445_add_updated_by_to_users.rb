class AddUpdatedByToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :updated_by, :integer
  end
end
