class AddCuisineToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :cuisine_id, :integer
  end
end
