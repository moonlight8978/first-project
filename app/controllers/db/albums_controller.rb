class Db::AlbumsController < ApplicationController
  def new
    @album = Db::Album.new
  end
  
  def create
    @album = Db::Album.create(create_album_params)
    
    unless @album.errors.any? 
      redirect_to @album
    else
      render 'new'
    end
  end
  
  def show
    @album = Db::Album.find(params[:id])
  end
  
  def index
    @title = 'アルバムリスト'
    @albums = Db::Album.all
  end
  
  def edit
    @album = Db::Album.find(params[:id])
  end
  
  def update
    @album = Db::Album.find(params[:id])
    @album.assign_attributes(update_album_params)
    
    (render plain: '何も変わらなかった。' and return) unless @album.changed?
    
    if @album.save
      redirect_to @album
    else
      render 'edit'
    end
  end

private
  
  def create_album_params
    params.require(:album).permit(
      :title, :title_en, :title_pronounce, :image
    )
  end
  
  def update_album_params
    params.require(:db_album).permit(
      :title, :title_en, :title_pronounce, :image
    )
  end
end