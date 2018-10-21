class Authors::Books::Update < ActiveInteraction::Base
  object :book
  string :description, :title, :language, default: nil
  float :price, default: nil
  integer :page, default: nil

  def execute
    attributes = inputs.except(:book).compact
    errors.merge!(book.errors) unless book.update(attributes)

    book
  end
end