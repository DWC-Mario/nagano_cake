class Public::ItemsController < ApplicationController
  def index
    @items=Item.all.page(params[:page]).per(8)
    @search = params[:search]
    if params[:search].present?
      @items = Item.where('item_name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(8)
    end
  end

  def show
     @item = Item.find(params[:id])
     @cart_item = CartItem.new
  end

   private
  def item_params
   params.require(:item).permit(:item_name, :item_image, :item_explanation, :genre_id, :price)
  end
end
