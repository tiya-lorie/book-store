class Api::V1::CustomersController < Api::V1::ApplicationController
  before_action :set_customer, except: %i[index create]

  def index
    customers = ::Customers::List.run!
    render json: { customers: customers.as_json }
  end

  def show
    render json: { customer: @customer.as_json }
  end

  def create
    customer = ::Customers::Create.run!(params)
    render json: { customer: customer.as_json }
  end

  def update
    ::Customers::Update.run!(params.merge(customer: @customer))
    render json: { customer: @customer.as_json }
  end

  def destroy
    ::Customers::Destroy.run!(customer: @customer)
    render json: { message: 'Customer deleted successfully' }
  end

  private

  def set_customer
    @customer = ::Customers::Find.run!(id: params[:id])
  end
end
