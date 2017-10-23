class DropItemIdFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :item_id
  end
end
