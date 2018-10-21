class Authors::Books::Create < ActiveInteraction::Base
  object :author
  string :title, :language
  float :price
  string :description, default: nil
  integer :page, default: nil

  def execute
    book = author.books.new(inputs.except(:author))
    errors.merge!(book.errors) unless book.save

    book
  end
end