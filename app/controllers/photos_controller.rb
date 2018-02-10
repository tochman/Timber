class PhotosController < ApplicationController

  before_action :get_album, only: [:create, :destroy, :edit, :update]
  before_action :get_photo, only: [:destroy, :edit, :update]

  def index
    @photos = current_user.photos
  end

  def new
    @photo = Photo.new
    @album_id = params[:album_id]
  end

  def create
    photos = []
    photo_params[:image].each do |file|
      @photo = @album.photos.create(title: photo_params[:title], image: file)
      photos.push @photo
    end if photo_params[:image]

    if params[:file]
      file = params[:file]
      @photo = @album.photos.create(title: photo_params[:title], image: file)
      photos.push @photo
    end

    if photos_present_and_valid?(photos)
      flash[:notice] = set_success_flash(photos)
      if params.key?(:finish_upload)
        redirect_to album_path(@album)
      else
        redirect_to new_album_photo_path(@album)
      end
    else
      flash[:alert] = set_errors_flash(photos)
      redirect_to new_album_photo_path(@album)
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = 'The photo was deleted.'
    redirect_to album_photos_path(@album)
  end

  def edit
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

  def get_album
    @album = Album.find(params[:album_id])
  end

  def get_photo
    @photo = Photo.find(params[:id])
  end

  def set_success_flash(array)
    array.count == 1 ? 'Successfully created a new photo!' : "Successfully created #{array.count} photos!"
  end

  def set_errors_flash(array)
    message = 'Error, no photo was created'
    array.each{ |photo| message += '<br/>' + photo.errors.full_messages.first}
    message
  end

  def photos_present_and_valid?(array)
    binding.pry
    array.any? && array.all?(&:valid?)
  end

end
