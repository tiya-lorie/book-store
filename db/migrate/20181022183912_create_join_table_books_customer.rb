class CreateJoinTableBooksCustomer < ActiveRecord::Migration[5.1]
  def change
    create_join_table :books, :customers do |t|
      t.index [:book_id, :customer_id], name: :books_customers_index
    end
  end
end
