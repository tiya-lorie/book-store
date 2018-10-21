class Authors::Books::List < ActiveInteraction::Base
  object :author
  
  def execute
    author.books
  end
end