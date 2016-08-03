class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @photo = @place.photos.create(photo_params.merge(user: current_user))
    if @photo.valid?
      flash[:success] = "Photo successfully added."
      redirect_to place_path(@place)
    else
      redirect_to place_path(@place)
      flash[:error] = flash_error_message(@photo)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end
