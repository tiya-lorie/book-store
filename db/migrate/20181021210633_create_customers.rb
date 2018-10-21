class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :country
      t.string :language
      t.string :address
      t.integer :telephone
      t.string :email

      t.timestamps
    end
  end
end
