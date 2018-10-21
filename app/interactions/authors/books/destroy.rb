class Authors::Books::Destroy < ActiveInteraction::Base
  object :book

  def execute
    book.delete
  end
end