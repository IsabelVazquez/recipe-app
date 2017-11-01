class Recipe < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  belongs_to :cuisine
  accepts_nested_attributes_for :items, reject_if: lambda {|attributes| attributes['name'].blank?},
    allow_destroy: true

  validates :name, uniqueness: true
  validates :steps, length: { in: 10..2000 }
  validates :name, :time, :steps, :cuisine_id, presence: true

  scope :short_time, -> { where("time <= ?", 30) }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def cuisine_attributes=(attributes_hash)
    self.cuisine = Cuisine.find_or_create_by(:name => attributes_hash[:name])
  end

  def self.by_cuisine(cuisine_id)
    where(cuisine: cuisine_id)
  end

  def self.by_item(name)
    items = Item.all.select{ |item| item.name.strip.downcase == name.strip.downcase }
    items.map{ |x| x.recipe }
  end
end
