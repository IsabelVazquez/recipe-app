class AddTimeToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :time, :integer
  end
end
