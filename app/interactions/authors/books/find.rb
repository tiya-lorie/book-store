class Authors::Books::Find < ActiveInteraction::Base
  integer :id

  def execute
    Book.find_by_id(id)
  end
end