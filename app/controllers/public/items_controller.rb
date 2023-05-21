class Public::ItemsController < ApplicationController
  # before_action :authenticate_public!, only: [:show]
  def index
    @items=Item.all.page(params[:page]).per(8)
  end

  def show
     @item = Item.find(params[:id])
     @cart_item =CartItem.new
  end

   private
  def item_params
   params.require(:item).permit(:item_name, :item_image, :item_explanation, :genre_id, :price)
  end
end
