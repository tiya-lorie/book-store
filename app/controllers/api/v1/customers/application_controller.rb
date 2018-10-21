class Api::V1::Customers::ApplicationController < Api::V1::ApplicationController
  private

  def set_customer
    @customer = ::Customers::Find.run!(id: params[:customer_id])
  end
end