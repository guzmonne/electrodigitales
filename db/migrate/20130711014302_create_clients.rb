class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :name
      t.text :member_number
      t.text :address
      t.integer :phone
      t.integer :cellphone
      t.text :email
      t.text :document
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
