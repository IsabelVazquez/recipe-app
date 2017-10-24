class AddRecipeIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :recipe_id, :integer
  end
end
