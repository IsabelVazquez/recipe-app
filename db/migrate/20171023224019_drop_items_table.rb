class DropItemsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :items
  end
end
