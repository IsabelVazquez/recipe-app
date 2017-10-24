class Recipe < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :ingredients, through: :items

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
  validates :name, :time, :steps, presence: true

  def self.short_time
    Recipe.all.select{ |recipe| recipe.time <= 30 }
  end

end
