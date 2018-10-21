class Authors::List < ActiveInteraction::Base
  def execute
    Author.all
  end
end