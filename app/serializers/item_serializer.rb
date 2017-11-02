class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :measurement, :quantity
end
