require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  let(:parsed_response) { JSON.parse(response.body) }
  let(:request_data) { { params: params } }
  let(:customer) { create(:customer) }

  describe 'GET index' do
    subject(:customers_subj) { parsed_response['customers'] }
    before { get :index }

    it('has to return customers array') { is_expected.to match_array JSON.parse(customers_subj.to_json) }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end

  describe 'GET show' do
    subject(:customer_subj) { parsed_response['customer'] }
    let(:params) { { id: customer.id } }
    before { get :show, request_data }

    it('has to return customer') { expect(customer_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end

  describe 'POST create' do
    subject(:customer_subj) { parsed_response['customer'] }
    let(:params) { { name: 'test', language: 'german', email: 'test@gmail.com', country: 'Ukraine', address: 'Kiev', telephone: 111112222 } }
    before { post :create, request_data }

    it('has to return created customer') { expect(customer_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end

  describe 'PUT update' do
    subject(:customer_subj) { parsed_response['customer'] }
    let(:params) { { id: customer.id, name: 'test-test', language: 'english' } }
    before { put :update, request_data }

    it('has to return updated customer') { expect(customer_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end

  describe 'DELETE destroy' do
    subject(:message) { parsed_response['message'] }
    let(:params) { { id: customer.id } }
    before { delete :destroy, request_data }

    it('has to return successfully message') { is_expected.to match 'successfully' }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end
end