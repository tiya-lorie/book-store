class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :biography
      t.integer :age
      t.string :country
      t.string :language
      t.string :gender

      t.timestamps
    end
  end
end
