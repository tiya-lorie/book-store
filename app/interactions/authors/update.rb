class Authors::Update < ActiveInteraction::Base
  object :author
  string :biography, :country, :gender, :name, :language, default: nil
  integer :age, default: nil

  def execute
    attributes = inputs.except(:author).compact
    errors.merge!(author.errors) unless author.update(attributes)

    author
  end
end