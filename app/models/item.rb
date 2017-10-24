class Item < ApplicationRecord
  # prevents "Item does not have ingredient"
  has_many :ingredients, inverse_of: :item, dependent: :destroy

  accepts_nested_attributes_for :ingredients,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true

  belongs_to :recipe

  validates :name, presence: true

  def ingredients_attributes=(ingredients)
    self.ingredients << ingredients.values.collect do |attributes|
      ingredient = Ingredient.new(attributes)
      # ingredient.user = current_user
      ingredient
    end
  end
end