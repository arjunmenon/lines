# Handles file uploads for content pictures.
class Admin::PicturesController < Admin::ApplicationController

  def create
    @picture = Picture.create(picture_params)
  end

  # PUT /admin/pictures/1
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # Deletes a picture. Only responds to JS requests.
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.js
    end
  end

  private

    # strong_params
    def picture_params
      params.fetch(:picture, {}).permit(:image)
    end
end
