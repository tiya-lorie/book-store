class Authors::Find < ActiveInteraction::Base
  integer :id

  def execute
    Author.find_by_id(id)
  end
end