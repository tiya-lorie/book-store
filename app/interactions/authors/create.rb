class Authors::Create < ActiveInteraction::Base
  string :name, :language
  integer :age, default: nil
  string :biography, :country, :gender, default: nil

  def execute
    author = Author.new(inputs)
    errors.merge!(author.errors) unless author.save

    author
  end
end