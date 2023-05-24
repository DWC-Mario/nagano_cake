class Public::HomesController < ApplicationController
  def top
    @k = 1
    @items = Item.order('id DESC').limit(4)
    @item_images = Item.order('id DESC').limit(10)
  end

  def about
  end
  
end
