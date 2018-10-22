class RemoveReferenceFromBooks < ActiveRecord::Migration[5.1]
   def change
    if foreign_key_exists?(:books, :bag)
      remove_foreign_key :books, :bag
    end
  end
end
