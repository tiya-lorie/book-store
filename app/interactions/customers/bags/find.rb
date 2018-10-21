class Customers::Bags::Find < ActiveInteraction::Base
  object :customer

  def execute
    Customer.bag
  end
end