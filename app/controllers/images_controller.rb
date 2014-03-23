class ImagesController < ApplicationController
  respond_to :json
  before_filter :find_image, except: %w(create index)
  before_filter :authenticate_user!, except: %w(index show)

  def index
    @images = Image.where search_params
    respond_with @images
  end

  def show
    respond_with @image
  end

  def create
    @image = Image.new create_params

    if @image.save
      respond_with @image, notice: "Uploaded image."
    else
      render json: { errors: @image.errors }, \
        alert: "Could not upload image."
    end
  end

  def update
    if @image.update_attributes update_params
      respond_with @image, notice: "Updated image title."
    else
      render json: { errors: @image.errors }, \
        alert: "Could not update image metadata."
    end
  end

  def destroy
    if @image.destroy
      respond_with notice: "Image has been removed."
    else
      respond_with alert: "Could not remove Image."
    end
  end

  private
  def find_image
    @image = Image.find params[:id]
  end

  def search_params
    params.permit :title
  end

  def create_params
    params.require(:image).permit :title, :file
  end

  def update_params
    params.require(:image).permit :title
  end
end
