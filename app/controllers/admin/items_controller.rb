class Admin::ItemsController < ApplicationController
  def index
     @items=Item.all.page(params[:page]).per(8)
     @item=Item.new
  end

  def edit
  end

  def new
    @item=Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_items_path(@item)
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_image, :item_explanation, :genre_id, :price, :is_active)
  end
end
