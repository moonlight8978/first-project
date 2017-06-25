class Api::V1::Vndb::ScreenshotsController < ApplicationController
  def index
    novel = ::Vndb::Novel.find(params[:novel_id])
    @screenshots = novel.screenshots

    render json: @screenshots, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::ScreenshotSerializer
  end

  def create

  end

  def update

  end

  def destroy

  end
end
