class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
     @items=Item.all.page(params[:page]).per(10)
     @item=Item.new
  end

  def edit
    @item = Item.find(params[:id])
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
    flash[:notice] = "新規商品を登録しましした。"
    redirect_to admin_item_path(@item)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    flash[:notice] = "登録商品を編集しました"
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_image, :item_explanation, :genre_id, :price, :is_active, :genre_name)
  end
end
