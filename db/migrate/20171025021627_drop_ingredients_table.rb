class DropIngredientsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :ingredients
  end
end
