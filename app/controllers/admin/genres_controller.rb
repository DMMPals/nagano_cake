class Admin::GenresController < ApplicationController


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "登録しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    if @genre = Genre.find(params[:id])
       @genre.update(genre_params)
       flash[:notice] = "変更しました"
       redirect_to admin_genres_path
    else
       render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
