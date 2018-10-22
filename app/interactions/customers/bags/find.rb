class Customers::Bags::Find < ActiveInteraction::Base
  integer :id

  def execute
    Bag.find_by_id(id)
  end
end