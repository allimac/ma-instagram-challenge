class PhotosController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end
