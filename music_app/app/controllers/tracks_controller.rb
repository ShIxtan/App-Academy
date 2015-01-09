class TracksController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @tracks = @album.tracks
    render :index
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def new
    @track = Track.new
    @track.album_id = params[:album_id]
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.update(params[:id], track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    Track.destroy(params[:id])
    redirect_to tracks_url
  end

  private

  def track_params
    params.require(:track).permit(:name, :bonus, :lyrics, :album_id)
  end
end
