class Customers::Update < ActiveInteraction::Base
  object :customer
  string :address, :country, :email, :language, :name, default: nil
  integer :telephone, default: nil

  def execute
    attributes = inputs.except(:customer).compact
    errors.merge!(customer.errors) unless customer.update(attributes)

    customer
  end
end