class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Imagen agregada"
      redirect_to images_path
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:notice] = "Imagen eliminada"
      redirect_to images_path
    else
      flash[:alert] = "La imagen no pudo ser aliminada"
      redirect_to images_path
    end
  end

  def index
    @images = Image.all
    @categories = Category.all
  end

  private
    def image_params
      params.require(:image).permit(:image_title, :image, :category_id, :image_description,
      :image_file_size, :image_content_type, :remote_image_url)
    end
end
