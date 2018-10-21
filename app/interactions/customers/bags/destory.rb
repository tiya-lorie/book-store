class Customers::Bags::Destroy < ActiveInteraction::Base
  object :bag

  def execute
    bag.delete
  end
end