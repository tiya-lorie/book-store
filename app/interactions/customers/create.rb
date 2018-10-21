class Customers::Create < ActiveInteraction::Base
  string :address, :country, :email, :name
  integer :telephone
  string :language, default: nil

  def execute
    customer = Customer.new(inputs)
    errors.merge!(customer.errors) unless customer.save

    customer
  end
end