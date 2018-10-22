require 'rails_helper'

RSpec.describe Api::V1::Customers::BagsController, type: :controller do
  let(:parsed_response) { JSON.parse(response.body) }
  let(:request_data) { { params: params } }
  let(:customer) { create(:customer) }
  let(:bag) { create(:bag, customer_id: customer.id) }

  describe 'GET show' do
    subject(:bag_subj) { parsed_response['bag'] }
    let(:params) { { id: bag.id, customer_id: customer.id } }
    before { get :show, request_data }

    it('has to return bag') { expect(bag_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end

  describe 'POST create' do
    subject(:bag_subj) { parsed_response['bag'] }
    let(:params) { { customer_id: customer.id } }
    before { post :create, request_data }

    it('has to return created bag') { expect(bag_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end
end