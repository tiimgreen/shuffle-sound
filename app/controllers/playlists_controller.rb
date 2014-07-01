class PlaylistsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @playlist = Playlist.new
    3.times { track = @playlist.tracks.build }
  end

  def create
    @playlist = current_user.playlists.build playlist_params
    if @playlist.save
      flash[:success] = "Playlist created"
      redirect_to playlist_path @playlist
    else
      flash[:warning] = "Problem creating Playlist"
      render :new
    end
  end

  def show
    @playlist = Playlist.find_by ref: params[:ref]
    @tracks = @playlist.tracks
  end

  def edit
    @playlist = Playlist.find_by ref: params[:ref]
  end

  def update
    @playlist = Playlist.find_by ref: params[:ref]
    if @playlist.update_attributes playlist_params
      flash[:success] = "Playlist updated"
      redirect_to playlist_path @playlist
    else
      render :edit
    end
  end

  def index
    @playlists = Playlist.all
  end

  def destroy
    @playlist = Playlist.find_by ref: params[:ref]
    if @playlist.destroy
      flash[:success] = 'Playlist successfully deleted'
      redirect_to user_playlists_path current_user
    else
      flash[:warning] = 'Problem deleting playlist'
      redirect_to playlist_path @playlist
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :description,
                                     tracks_attributes: [:_destroy, :id, :url])
  end
end
