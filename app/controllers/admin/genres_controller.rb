class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.page(params[:page]).per(5)
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "genre was successfully created."
      redirect_to admin_genres_path
    else
      @genres = genre.all
      flash[:error] = "error!"
      flash[:notice] = @genre.errors.full_messages
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "Profile was successfully updated."
      redirect_to admin_genres_path
    else
      flash[:error] = "error!"
      flash[:notice] = @genre.errors.full_messages
      render :edit
    end
  end
  
  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end

