class Api::V1::Vndb::ReleasesController < ApplicationController
  def index
    @novel = ::Vndb::Novel
      .includes(releases: { developers: :country, publishers: :country })
      .find(params[:novel_id])
    @releases = @novel.releases
    render json: @releases, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::ReleaseSerializer
  end
end
