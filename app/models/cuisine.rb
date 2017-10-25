class Cuisine < ApplicationRecord
  has_many :recipes
  has_many :users, through: :recipes
end
