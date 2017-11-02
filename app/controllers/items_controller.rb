class ItemsController < ApplicationController
  load_and_authorize_resource :recipe
  load_and_authorize_resource :item, :through => :recipe
  before_action :find_recipe
  before_action :find_id, :except => [:new, :create, :index]

  def new
    @item = Item.new
  end

  def index
    @items = @recipe.items
    render json: @items
  end

  def create
    @item = @recipe.items.build(item_params)
    if @item.save
      render json: @item
    else
      render json: @item.errors.full_messages
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
    @item.destroy
    redirect_to @recipe
  end

  private
    def item_params
      params.require(:item).permit(:id, :name, :recipe_id, :measurement, :quantity)
    end

    def find_recipe
      @recipe = Recipe.find_by(id: params[:recipe_id])
    end

    def find_id
      @item = Item.find_by(id: params[:id])
    end

end
