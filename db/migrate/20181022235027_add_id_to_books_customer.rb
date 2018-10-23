class AddIdToBooksCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :books_customers, :id, :primary_key
  end
end