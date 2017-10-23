class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :items, through: :ingredients

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }

  def self.short_time
    Recipe.all.select{ |recipe| recipe.time <= 30 }
  end

  def self.by_user(user)
    Recipe.all.select{ |recipe| recipe.user_id = user.id }
  end
end
