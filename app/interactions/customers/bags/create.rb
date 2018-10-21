class Customers::Bags::Create < ActiveInteraction::Base
  object :customer

  def execute
    bag = Bag.new(customer_id: customer.id)
    errors.merge!(bag.errors) unless bag.save

    bag
  end
end