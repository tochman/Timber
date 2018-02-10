class PhotosController < ApplicationController
  before_action :album, only: %i[create destroy edit update]
  before_action :photo, only: %i[destroy edit update]

  def index
    @photos = current_user.photos
  end

  def new
    @photo = Photo.new
    @album_id = params[:album_id]
  end

  def create
    photos = []
    if photo_params[:image]
      photo_params[:image].each { |file| photos.push create_photo(file) }
    end

    photos.push create_photo if params[:file]

    if photos_present_and_valid?(photos)
      flash[:notice] = success_flash(photos)
      if params.key?(:finish_upload)
        redirect_to album_path(@album)
      else
        redirect_to new_album_photo_path(@album)
      end
    else
      flash[:alert] = errors_flash(photos)
      redirect_to new_album_photo_path(@album)
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = 'The photo was deleted.'
    redirect_to album_photos_path(@album)
  end

  def update
    if @photo.update(photo_params)
      flash[:alert] = 'Updated successfully'
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, image: [])
  end

  def create_photo(file = nil)
    @album.photos.create(
      title: photo_params[:title],
      image: file.nil? ? params[:file] : file
    )
  end

  def album
    @album = Album.find(params[:album_id])
  end

  def photo
    @photo = Photo.find(params[:id])
  end

  def success_flash(collection)
    I18n.t('new_photos', count: collection.count)
  end

  def errors_flash(collection)
    [
      'Error, no photo was created',
      collection.map { |photo| photo.errors.full_messages }
    ].flatten.join('<br />')
  end

  def photos_present_and_valid?(photos)
    photos.any? && photos.all?(&:valid?)
  end
end
