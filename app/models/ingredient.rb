class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :item
  
  validates :recipe_id, uniqueness: true
  validates :name, presence: true
end
