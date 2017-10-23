class AddQuantityAndMeasurementToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :quantity, :integer
    add_column :ingredients, :measurement, :string
  end
end
