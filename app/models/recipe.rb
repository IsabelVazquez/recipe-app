class Recipe < ApplicationRecord
  belongs_to :user
  # prevents "Recipe does not have ingredient"
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :ingredients,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
  validates :name, :time, :steps, presence: true

  def self.short_time
    Recipe.all.select{ |recipe| recipe.time <= 30 }
  end

  def ingredients_attributes=(ingredients)
    self.ingredients << ingredients.values.collect do |attributes|
      ingredient = Ingredient.new(attributes)
      # ingredient.user = current_user
      ingredient
    end
  end

end
