class Recipe < ApplicationRecord
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :items, reject_if: lambda {|attributes| attributes['name'].blank?},
    allow_destroy: true

  belongs_to :cuisine

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
  validates :name, :time, :steps, :cuisine, presence: true

  scope :short_time, -> { where("time <= ?", 30) }

  def cuisine_attributes=(attributes_hash)
    self.cuisine = Cuisine.find_or_create_by(:name => attributes_hash[:name])
  end

end
