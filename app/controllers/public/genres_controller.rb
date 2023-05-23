class Public::GenresController < ApplicationController
  def show
    @j = 1
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @item = Item.find(params[:id])
    @items=@genre.items.page(params[:page]).per(8)
  end
end
