class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :find_id, :except => [:new, :create, :index, :short_time]

  def new
    @recipe = Recipe.new
    # required for fields_for to work
    5.times { @recipe.items.build}
    @recipe.build_cuisine
  end

  def index
    @cuisines = Cuisine.all
    if !params[:cuisine].blank?
      @recipes = Recipe.by_cuisine(params[:cuisine])
    elsif !params[:item].blank?
      @recipes = Recipe.by_item(params[:item])
    else
      @recipes = Recipe.all
    end
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @recipes, :layout => false }
    end
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      5.times { @recipe.items.build }
      render 'new'
    end
  end

  def show
    respond_to do |format|
      @items = @recipe.items
      @item = @recipe.items.build
      format.html { render :show }
      format.json { render json: @recipe }
	  end
  end

  def edit
    5.times { @recipe.items.build}
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def short_time
    @recipes = Recipe.short_time
    render json: @recipes
  end

  private
    def recipe_params
      params.require(:recipe).permit(:avatar, :name, :steps, :time, items_attributes: [:id, :name, :quantity,
        :measurement, :_destroy], cuisine_attributes: [:id, :name])
    end

    def find_id
      @recipe = Recipe.find(params[:id])
    end

end
