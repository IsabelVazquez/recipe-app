class Item < ApplicationRecord
  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates :quantity, numericality: { greater_than: 0 }
  #to be done in checkbox form
  validates :measurement, presence: true
end
