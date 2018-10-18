class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :page

      t.timestamps
    end
  end
end
