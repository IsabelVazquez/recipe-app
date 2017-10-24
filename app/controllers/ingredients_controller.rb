class IngredientsController < ApplicationController
  before_action :find_id, :except => [:new, :create, :index, :show]

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def index
    @recipe = Recipe.find_by(id: params[:recipe_id])
    if @recipe.nil?
      redirect_to recipes_path
    else
      @ingredients = @recipe.ingredients
    end
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show #TBD
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @ingredient = @recipe.ingredients.find_by(id: params[:id])
    if @ingredient.nil?
      redirect_to @recipe
    end
  end

  def edit
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :user_id, :quantity, :measurement, :recipe_id)
    end

    def find_id
      @ingredient = Ingredient.find(params[:id])
    end
end
