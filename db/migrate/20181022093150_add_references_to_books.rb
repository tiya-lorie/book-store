class AddReferencesToBooks < ActiveRecord::Migration[5.1]
  def self.up
    def change
      add_reference :books, :bag, foreign_key: true
    end
  end

  def self.down
    def change
      remove_reference :books, :bag, foreign_key: true
    end
  end
end
