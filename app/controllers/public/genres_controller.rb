class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @item = Item.find(params[:id])
    @items= Item.all
  end
end
