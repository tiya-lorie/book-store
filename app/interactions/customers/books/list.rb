class Customers::Books::List < ActiveInteraction::Base
  object :customer
  
  def execute
    customer.books
  end
end