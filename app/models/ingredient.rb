class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  # validates :recipe_id, uniqueness: true | To Be Uncommented
  validates :name, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
