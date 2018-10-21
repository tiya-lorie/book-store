class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :author, index: true
      t.string :title
      t.text :description
      t.float :price
      t.integer :page
      t.string :language

      t.timestamps
    end
  end
end
