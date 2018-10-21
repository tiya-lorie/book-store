class Authors::Destroy < ActiveInteraction::Base
  object :author

  def execute
    author.delete
  end
end