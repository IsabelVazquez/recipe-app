class RecipesController < ApplicationController
  before_action :find_id, :except => [:new, :create, :index]

  def new
    @recipe = Recipe.new
    # required for fields_for to work
    # @recipe.ingredients.build
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :steps, :time)
    end

    def find_id
      @recipe = Recipe.find(params[:id])
    end

end
