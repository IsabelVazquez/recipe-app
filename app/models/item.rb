class Item < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients

  validates :quantity, numericality: { greater_than: 0 }

end
