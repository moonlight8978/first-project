class Api::V1::Db::Novels::ReleasesController < ApplicationController
  def index
    @releases = ::Db::Novel::Release
      .includes(:platform)
      .all

    paginate json: @releases, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page] || 10, page: params[:page] || 1,
      each_serializer: Api::V1::Db::Novel::Release::ReleaseListSerializer
  end

  def show
    @releases = ::Db::Novel::Release
      .includes(:platform, { developers: :country }, { publishers: :country }, :novels)
      .find(params[:id])

    render json: @releases, key_transform: :camel_lower, status: :ok,
      include: [:platform, { developers: :country }, { publishers: :country }, :novels],
      serializer: Api::V1::Db::Novel::Release::ReleaseDetailSerializer
  end

  def create
    add_svc = ReleaseService::CreateRelease.new(params[:novel_id], create_release_params)

    add_svc.perform
    if add_svc.errors?
      render json: add_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

  def update
    p update_release_params
    update_svc = ReleaseService::UpdateRelease.new(params[:id], update_release_params)

    update_svc.perform
    if update_svc.errors?
      render json: update_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

  # def index_novel
  #   @releases = ::Db::Novel
  #     .includes(releases: { developers: :country, publishers: :country })
  #     .find(params[:novel_id])
  #     .releases

  #   render json: @releases, key_transform: :camel_lower, status: :ok,
  #     each_serializer: Api::V1::Db::Novel::ReleaseSerializer
  # end

  # Add a release to novel
  def create_novel
    add_to_novel_svc = ReleaseService::AddReleaseToNovel
      .new(params[:novel_id], params[:id])

    add_to_novel_svc.perform
    if add_to_novel_svc.errors?
      render json: add_to_novel_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

  # If release exists in more than 1 novel, remove it
  # Else, destroy it
  def destroy_novel
    destroy_svc = ReleaseService::DestroyRelease.new(params[:novel_id], params[:id])

    destroy_svc.perform
    if destroy_svc.errors?
      render json: destroy_svc.errors, status: :bad_request
    else
      render_ok
    end
  end

private

  def create_release_params
    params.permit(
      :platform_id, :title, :title_en, :status, :voiced, :animation_ero,
      :animation_story, :jan_num, :released, :age_rating
    )
  end

  def update_release_params
    params.permit(
      :platform_id, :title, :title_en, :status, :voiced, :animation_ero,
      :animation_story, :jan_num, :released, :age_rating
    )
  end
end
