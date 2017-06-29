class Api::V1::Db::Novels::ScreenshotsController < ApplicationController
  def index
    @screenshots = ::Db::Novel.find(params[:novel_id])
      .screenshots

    render json: @screenshots, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::ScreenshotSerializer
  end

  def create
    p create_screenshots_params[:screenshots]
    # creating
  end

  def update
    @screenshot = ::Db::Novel::Screenshot.find(params[:id])
    p update_screenshot_params
    # updating
  end

  def destroy
    @screenshot = ::Db::Novel.find(params[:novel_id])
    # deleting
  end

private

  def create_screenshots_params
    params.permit(screenshots: [:image, :image_nsfw])
  end

  def update_screenshot_params
    params.permit(:image, :image_nsfw)
  end
end
