class Ingredient < ApplicationRecord
  belongs_to :item
  belongs_to :recipe

end
