class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates_presence_of :name, :language
  validates :name, length: { minimum: 1 }
  validates :language, length: { minimum: 1 }
  validates :biography, length: { maximum: 100_000 }
end