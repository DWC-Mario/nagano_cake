class Admin::ItemsController < ApplicationController
  def index
     @items=Item.all.page(params[:page]).per(10)
     @item=Item.new
  end

  def edit
    @item=Item.new
  end

  def new
    @item=Item.new
  end

  def show
    @item = Item.find(params[:id])
    @price_in_tax=(@item.price*1.1).floor
    # @genre=Genre.find([:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_item_path(@item)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_image, :item_explanation, :genre_id, :price, :is_active, :genre_name)
  end
end
