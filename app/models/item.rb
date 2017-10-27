class Item < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
