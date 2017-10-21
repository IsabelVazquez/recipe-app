class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :items, through: :ingredients

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
end
