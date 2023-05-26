class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.page(params[:page]).per(10)
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンル登録が完了しました。"
      redirect_to admin_genres_path
    else
      flash[:notice] = @genre.errors.full_messages
      @genres = Genre.page(params[:page]).per(10)
      @genre = Genre.new
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの編集しました。"
      redirect_to admin_genres_path
    else
      flash[:notice] = @genre.errors.full_messages
      render :edit
    end
  end
  
  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end

