class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :steps, :time, :user_id, :cuisine_id
  has_many :items
  # belongs_to :user
  # belongs_to :cuisine
end
