class Api::V1::Db::Novels::ReleasesController < ApplicationController
  def index
    @releases = ::Db::Novel::Release.all

    paginate json: @releases, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Novel::ReleaseSerializer
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end

  def index_novel
    @novel = ::Db::Novel
      .includes(releases: { developers: :country, publishers: :country })
      .find(params[:novel_id])
    @releases = @novel.releases

    render json: @releases, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Novel::ReleaseSerializer
  end
end
