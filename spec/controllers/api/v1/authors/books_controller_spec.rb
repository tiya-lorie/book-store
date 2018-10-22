require 'rails_helper'

RSpec.describe Api::V1::Authors::BooksController, type: :controller do
  let(:parsed_response) { JSON.parse(response.body) }
  let(:request_data) { { params: params } }
  let(:author) { create(:author) }
  let(:book) { create(:book, author_id: author.id) }

  describe 'GET show' do
    subject(:book_subj) { parsed_response['book'] }
    let(:params) { { id: book.id } }
    before { get :show, request_data }

    it('has to return book') { expect(book_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end

  describe 'POST create' do
    subject(:book_subj) { parsed_response['book'] }
    let(:params) { { title: 'test', language: 'german', price: 100, author_id: author.id } }
    before { post :create, request_data }

    it('has to return created book') { expect(book_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end

  describe 'PUT update' do
    subject(:book_subj) { parsed_response['book'] }
    let(:params) { { id: book.id, title: 'test-test', language: 'english' } }
    before { put :update, request_data }

    it('has to return updated book') { expect(book_subj['id']).to be_truthy }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }    
  end

  describe 'DELETE destroy' do
    subject(:message) { parsed_response['message'] }
    let(:params) { { id: book.id } }
    before { delete :destroy, request_data }

    it('has to return successfully message') { is_expected.to match 'successfully' }
    it('has 200 status code') { expect(response.status).to eq 200 }
    it('has return json') { expect(response.content_type).to eq 'application/json' }
  end
end