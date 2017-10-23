class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
  validates :name, :time, :steps, presence: true

  def self.short_time
    Recipe.all.select{ |recipe| recipe.time <= 30 }
  end

  # def ingredients_attributes=(ingredients_attributes)
    # ingredients_attributes = [
    #   {:ingredient_1 => "Chocolate chips"},
    #   {:ingredient_2 => "Dough"},
    #   {:ingredient_3 => "Milk"}
    # ]
  #   ingredients_attributes.each do |ingredient_attributes|
  #     self.ingredients.build(ingredient_attributes)
  #   end
  # end
end
