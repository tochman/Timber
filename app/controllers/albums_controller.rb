class AlbumsController < ApplicationController

before_action :check_for_family, only: [:create]

  def index
    if params[:my_albums]
      @albums = current_user.my_albums
      @title = "My albums"
    else
      @albums = current_user.family.albums
      @title = "Shared albums"
    end
    @recent_photos = @albums.map(&:photos).flatten.sort_by(&:created_at).last(3)
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params.merge(creator_id: current_user.id))
    @album.family = current_user.family
    if @album.save
      redirect_to album_path(@album)
    end
  end

  private
  def album_params
    params.require(:album).permit(:title)
  end

  def check_for_family
    current_user.has_family?
  end

end
