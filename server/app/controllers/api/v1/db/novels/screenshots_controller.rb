class Api::V1::Db::Novels::ScreenshotsController < ApplicationController
  def index
    @screenshots = ::Db::Novel.find(params[:novel_id])
      .screenshots

    render json: @screenshots, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::ScreenshotSerializer
  end

  def create
    novel = ::Db::Novel.find(params[:novel_id])
    ss = novel.screenshots.create(create_screenshots_params)

    if ss.errors.any?
      render json: ErrorMessage.new(ss.errors).detail, status: :bad_request
    else
      render_ok
    end
  end

  def update
    @screenshot = ::Db::Novel::Screenshot.find(params[:id])
    @screenshot.assign_attributes(update_screenshot_params)
    @errors = ErrorMessage.new

    if @screenshot.changed?
      @screenshot.save || @errors.add!(@screenshot.errors)
    else
      @errors.add!(message_from_server: 'Nothing changed!')
    end

    if @errors.any?
      render json: @errors.detail, status: :bad_request
    else
      render_ok
    end
  end

  def destroy
    @screenshot = ::Db::Novel::Screenshot.find(params[:id])
    begin
      @screenshot.destroy!
    rescue ActiveRecord::RecordNotDestroyed => e
      @errors = ErrorMessage.new(e.record.errors)
    end

    if @errors && @errors.any?
      render json: @errors.detail, status: :bad_request
    else
      render_ok
    end
  end

private

  def create_screenshots_params
    params.permit(:image, :image_nsfw)
  end

  def update_screenshot_params
    params.permit(:image, :image_nsfw)
  end
end
