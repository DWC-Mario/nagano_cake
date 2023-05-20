class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
    # ASCだと古い順でDESCで新着順です。

    # @items_latest4 = @item.first(4)
  end

  def about
  end
  
end
