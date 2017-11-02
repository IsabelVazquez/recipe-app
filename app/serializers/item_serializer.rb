class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :measurement, :quantity
  belongs_to :recipe
end
