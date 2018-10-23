class Customers::Books::Create < ActiveInteraction::Base
  object :customer, :book

  def execute
    books_customer = book.books_customers.new(customer_id: customer.id)
    errors.merge!(books_customer.errors) unless books_customer.save

    books_customer
  end
end