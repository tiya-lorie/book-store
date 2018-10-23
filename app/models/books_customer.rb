class BooksCustomer < ApplicationRecord
  belongs_to :book
  belongs_to :customer

  validates_uniqueness_of :book_id, scope: :customer_id
end