class RecipesController < ApplicationController
  before_action :find_id, :except => [:new, :create, :index]

  def new
    @recipe = Recipe.new
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
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :steps)
    end

    def find_id
      @recipe = Recipe.find(params[:id])
    end

end
