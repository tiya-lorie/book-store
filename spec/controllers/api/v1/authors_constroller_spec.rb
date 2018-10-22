require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :controller do
  let(:parsed_response) { JSON.parse(response.body) }
  let(:request_data) { { params: params } }
  let(:author) { create(:author) }

  describe 'GET index' do
    subject(:authors_subj) { parsed_response['authors'] }
    before { get :index }

    it('has to return authors array') { is_expected.to match_array JSON.parse(authors_subj.to_json) }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end

  describe 'GET show' do
    subject(:author_subj) { parsed_response['author'] }
    let(:params) { { id: author.id } }
    before { get :show, request_data }

    it('has to return author') { expect(author_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end

  describe 'POST create' do
    subject(:author_subj) { parsed_response['author'] }
    let(:params) { { name: 'test', language: 'german' } }
    before { post :create, request_data }

    it('has to return created author') { expect(author_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end

  describe 'PUT update' do
    subject(:author_subj) { parsed_response['author'] }
    let(:params) { { id: author.id, name: 'test-test', language: 'english' } }
    before { put :update, request_data }

    it('has to return updated author') { expect(author_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end

  describe 'DELETE destroy' do
    subject(:message) { parsed_response['message'] }
    let(:params) { { id: author.id } }
    before { delete :destroy, request_data }

    it('has to return successfully message') { is_expected.to match 'successfully' }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end
end