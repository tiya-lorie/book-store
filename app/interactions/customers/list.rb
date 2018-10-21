class Customers::List < ActiveInteraction::Base
  def execute
    Customer.all
  end
end