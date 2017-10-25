class ItemsController < ApplicationController
  before_action :find_recipe
  before_action :find_id, :except => [:new, :create, :index]

  def new
    @item = Item.new
  end

  def index
    @items = @recipe.items
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def item_params
      params.require(:item).permit(:name, :recipe_id, :measurement, :quantity, :ingredients_attributes => [
        :id, :quantity, :measurement, :_destroy
      ])
    end

    def find_recipe
      @recipe = Recipe.find_by(id: params[:recipe_id])
    end

    def find_id
      @item = Item.find(params[:id])
    end

end
