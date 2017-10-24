class DropColumnsFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :name
    remove_column :ingredients, :quantity
    remove_column :ingredients, :measurement
  end
end
