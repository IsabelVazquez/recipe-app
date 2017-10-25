class Recipe < ApplicationRecord
  belongs_to :user
  #has_many :ingredients
  has_many :items #, through: :ingredients
  accepts_nested_attributes_for :items, reject_if: lambda {|attributes| attributes['name'].blank?},
    allow_destroy: true

  # belongs_to :cuisine

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
  validates :name, :time, :steps, presence: true

  def self.short_time
    Recipe.all.select{ |recipe| recipe.time <= 30 }
  end

end
