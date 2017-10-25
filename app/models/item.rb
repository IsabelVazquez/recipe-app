class Item < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  #returns array of recipes with the same item
  def self.recipes(name)
    items = Item.all.select{ |item| item.name.strip.downcase == name.strip.downcase }
    items.map{ |x| x.recipe }
  end
end
