class Api::V1::Db::Novels::ScreenshotsController < ApplicationController
  def index
    novel = ::Db::Novel.find(params[:novel_id])
    @screenshots = novel.screenshots

    render json: @screenshots, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::ScreenshotSerializer
  end

  def create
    novel = ::Db::Novel.find(params[:novel_id])
  end

  def update
    novel = ::Db::Novel.find(params[:novel_id])
    @screenshot = novel.screenshots.find(params[:id])
    @screenshot.image = params[:image]
    @screenshot.image_nsfw = params[:image_nsfw]

    p @screenshot.image_change
    p @screenshot.image_nsfw_change
    p novel.screenshot_ids.include?(5)
    novel.screenshots.clear
  end

  def destroy
    novel = ::Db::Novel.find(params[:novel_id])
  end
end
