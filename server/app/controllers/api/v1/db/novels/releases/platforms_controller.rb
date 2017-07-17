class Api::V1::Db::Novels::Releases::PlatformsController < ApplicationController
  def index
    @platforms = ::Db::Novel::Release::Platform.all

    render json: @platforms, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::Release::PlatformSerializer
  end
end
