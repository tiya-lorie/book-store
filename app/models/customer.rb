class Customer < ApplicationRecord
  has_one :bag, dependent: :destroy
  has_many :books, through: :bag

  validates_presence_of :country, :address, :telephone, :email, :name
  validates :name, length: { minimum: 1 }
  validates :language, length: { minimum: 1 }
end