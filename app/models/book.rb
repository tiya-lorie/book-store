class Book < ApplicationRecord
  belongs_to :author  
  has_many :books_customers
  has_many :customers, through: :books_customers
  
  validates_presence_of :title, :price, :language
  validates :title, length: { minimum: 1 }
  validates :description, length: { maximum: 100_000 }
  validates_numericality_of :price, greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999
end
