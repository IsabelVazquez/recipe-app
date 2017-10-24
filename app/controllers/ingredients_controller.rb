class IngredientsController < ApplicationController
  before_action :find_id, :except => [:new, :create, :index, :show]

  def new
    @item = Item.find_by(id: params[:item_id])
    @ingredient = Ingredient.new
  end

  def index
    @item = Item.find_by(id: params[:item_id])
    if @item.nil?
      redirect_to items_path
    else
      @ingredients = @item.ingredients
    end
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @item
    else
      render :new
    end
  end

  def show #TBD
    @item = Item.find_by(id: params[:item_id])
    @ingredient = @item.ingredients.find_by(id: params[:id])
    if @ingredient.nil?
      redirect_to @item
    end
  end

  def edit
    @item = Item.find_by(id: params[:item_id])
  end

  def update
    @item = Item.find_by(id: params[:item_id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :item_id, :quantity, :measurement, :recipe_id)
    end

    def find_id
      @ingredient = Ingredient.find(params[:id])
    end
end
