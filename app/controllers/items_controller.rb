class ItemsController < ApplicationController
  before_action :find_id, :except => [:new, :create, :index]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def item_params
      params.require(:item).permit(:quantity, :measurement)
    end

    def find_id
      @item = Item.find(params[:id])
    end

end
