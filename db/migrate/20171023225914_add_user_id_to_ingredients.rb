class AddUserIdToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :user_id, :integer
  end
end
