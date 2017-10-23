class Ingredient < ApplicationRecord
  # belongs_to :recipe | To Be Uncommented
  belongs_to :item

  # validates :recipe_id, uniqueness: true | To Be Uncommented
  validates :name, presence: true
end
