class CreateBags < ActiveRecord::Migration[5.1]
  def change
    create_table :bags do |t|
      t.references :customer, index: true

      t.timestamps
    end
  end
end
