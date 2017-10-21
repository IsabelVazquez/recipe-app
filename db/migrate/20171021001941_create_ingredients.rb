class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :item_id
      t.string :name

      t.timestamps
    end
  end
end
