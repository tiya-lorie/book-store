class Api::V1::Customers::BagsController < Api::V1::Customers::ApplicationController
  before_action :set_customer, only: %i[show create]
  before_action :set_bag, except: %i[create]

  def show
    render json: { bag: @bag.as_json }
  end

  def create
    bag = ::Customers::Bags::Create.run!(params.merge(customer: @customer))
    render json: { bag: bag.as_json }
  end

  def destroy
    ::Customers::Bags::Destroy.run!(bag: @bag)
    render json: { message: 'Bag deleted successfully' }
  end

  private

  def set_bag
    @bag = ::Customers::Bags::Find.run!(customer: @customer)
  end
end