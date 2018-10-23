class Customer < ApplicationRecord
  has_many :books_customers
  has_many :books, through: :books_customers
  
  validates_presence_of :country, :address, :telephone, :email, :name
  validates :name, length: { minimum: 1 }
  validates :language, length: { minimum: 1 }
end