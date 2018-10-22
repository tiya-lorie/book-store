class Bag < ApplicationRecord
  belongs_to :customer
  has_many :books
end
