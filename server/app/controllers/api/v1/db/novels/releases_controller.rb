class Api::V1::Db::Novels::ReleasesController < ApplicationController
  def index
    @releases = ::Db::Novel::Release.all

    paginate json: @releases, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Db::Novel::Release::ReleaseListSerializer
  end

  def show
    @releases = ::Db::Novel::Release.find(params[:id])

    render json: @releases, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Db::Novel::Release::ReleaseDetailSerializer
  end

  def create
    @novel = ::Db::Novel.find(params[:novel_id])
  end

  def update
    @release = ::Db::Novel::Release.find(params[:id])
  end

  def destroy
    @release = ::Db::Novel::Release.find(params[:id])
    p @release.novels
  end

  def index_novel
    @releases = ::Db::Novel
      .includes(releases: { developers: :country, publishers: :country })
      .find(params[:novel_id])
      .releases

    render json: @releases, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::ReleaseSerializer
  end

  def update_novel
    @novel = ::Db::Novel.find(params[:novel_id])
    release_ids = update_release_novel_params[:releases]
    # release_ids = update_release_novel_params[:releases].map(&:to_i)
    # p @novel.release_ids.include?()
    loz = release_ids - @novel.release_ids
    p loz
  end

private

  def create_release_params
    params.permit(
      :platform_id, :title, :title_en, :status, :voiced,
      :animation_ero, :animation_story, :jan_num
    )
  end

  def update_release_params
    params.permit(
      :platform_id, :title, :title_en, :status, :voiced,
      :animation_ero, :animation_story, :jan_num
    )
  end

  def update_release_novel_params
    params.permit(releases: [])
  end
end
