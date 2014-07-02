class TracksController < ApplicationController

  def create
    @playlist = Playlist.find_by ref: params[:ref]
    @track = @playlist.tracks.build track_params
    if @track.save
      flash[:success] = "Track added!"
      redirect_to playlist_path @playlist
    else
      flash[:error] = "Error adding track"
      redirect_to playlist_path @playlist
    end
  end

  def show
    @track = Track.find params[:id]
  end

  def vote
    @track = Track.find params[:track][:id]
    @track.points += 1
    @track.save
    obj = { id: @track.id, points: @track.points }
    render json: obj.to_json, status: 200
  end

  private

  def track_params
    params.require(:track).permit(:url)
  end
end
