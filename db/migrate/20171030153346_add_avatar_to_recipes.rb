class AddAvatarToRecipes < ActiveRecord::Migration[5.1]
  def up
    add_attachment :recipes, :avatar
  end

  def down
    remove_attachment :recipes, :avatar
  end
end
