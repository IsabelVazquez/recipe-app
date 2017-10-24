class Ingredient < ApplicationRecord
  # prevents Ingredient does not have item
  belongs_to :item, inverse_of: :ingredients
  belongs_to :recipe

  # validates :recipe_id, uniqueness: true | To Be Uncommented
  validates :quantity, numericality: { greater_than: 0 }

  def self.recipes(name)
    Ingredient.all.select{ |ingred| ingred.recipe.name if ingred.name.downcase == name.downcase }
  end
end
