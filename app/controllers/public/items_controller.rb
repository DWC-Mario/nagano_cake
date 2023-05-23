class Public::ItemsController < ApplicationController
  def index
    @i = 1
    @genres=Genre.all
    if params[:query].present?
      @items=Item.where('item_name LIKE ?', '%' + params[:query] + '%').page(params[:page]).per(8)
    else
      @items=Item.all.page(params[:page]).per(8)
    end

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres=Genre.all
  end

   private
  def item_params
   params.require(:item).permit(:item_name, :item_image, :item_explanation, :genre_id, :price)
  end
end
