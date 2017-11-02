class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :steps, :time, :user_id, :items
  belongs_to :cuisine

  private
    # serialize every item associated with a recipe
    def items
      ItemSerializer.new(object.items).attributes
    end
end
