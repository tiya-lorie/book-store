class Customers::Destroy < ActiveInteraction::Base
  object :customer

  def execute
    customer.delete
  end
end