class AlbumsController < ApplicationController
  before_action :require_login

  def index
    @band = Band.find(params[:band_id])
    @albums = @band.albums

    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.update(params[:id], album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :category, :band_id)
  end
end
