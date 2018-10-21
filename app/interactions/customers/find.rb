class Customers::Find < ActiveInteraction::Base
  integer :id

  def execute
    Customer.find_by_id(id)
  end
end