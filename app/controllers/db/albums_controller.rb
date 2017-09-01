class Db::AlbumsController < ApplicationController
  def new
    @title = '新しいアルバムを作る'
    @album = Db::Album.new
  end
  
  def create
    @album = Db::Album.create(album_params)
    
    unless @album.errors.any? 
      redirect_to @album
    else
      render 'new'
    end
  end
  
  def show
    @album = Db::Album.find(params[:id])
    @title = @album.title
  end
  
  def index
    @title = 'アルバムリスト'
    _order = params[:sort].present? ? params[:sort] : :title_pronounce
    _direction = params[:reverse_sort].present? ? :desc : :asc
    
    @albums = Db::Album.all
      .order(_order => _direction)
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)
      
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @albums, status: :ok }
    end
  end
  
  def edit
    @album = Db::Album.find(params[:id])
  end
  
  def update
    @album = Db::Album.find(params[:id])
    @album.assign_attributes(album_params)
    
    (render plain: '何も変わらなかった。' and return) unless @album.changed?
    
    if @album.save
      redirect_to @album
    else
      render 'edit'
    end
  end
  
  def search
    @title = "Search results for #{params[:q]}"
    search = Db::Album.search do
      keywords params[:q], highlight: true
      order_by(:title_pronounce, :asc)
      paginate(page: params[:page] || 1, per_page: params[:per_page] || 10)
    end
    
    @albums = search.results
  end

private

  def album_params
    params.require(:db_album).permit(
      :title, :title_en, :title_pronounce, :image
    )
  end
end