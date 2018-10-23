class DropBagsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :bags
  end
end
