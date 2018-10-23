class Customers::Books::Destroy < ActiveInteraction::Base
  object :book
  integer :customer_id

  def execute
    book.books_customers.where(customer_id: customer_id).destroy_all
  end
end