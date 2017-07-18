class Api::V1::Db::Novels::Releases::PlatformsController < ApplicationController
  def index
    @platforms = ::Db::Novel::Release::Platform.all

    render json: @platforms, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Novel::Release::PlatformSerializer
  end

  def create
    exists = ::Db::Novel::Release::Platform.exists?(platform: params[:platform])
    errors = ErrorMessage.new

    unless exists
      @platform = ::Db::Novel::Release::Platform.create(create_platform_params)
      @platform.errors.any? && errors.add!(@platform.errors)
    else
      errors.add!(message_from_server: 'Platform is already exists!')
      render json: errors, status: :conflict
      return
    end

    unless errors.any?
      render_ok
    else
      render json: errors, status: :bad_request
    end
  end

  def update
    @platform = ::Db::Novel::Release::Platform.find(params[:id])
    errors = ErrorMessage.new
    @platform.assign_attributes(update_platform_params)

    if @platform.changed?
      @platform.save || errors.add!(@platform.errors)
    else
      errors.add!(message_from_server: 'Nothing changed!')
    end

    unless errors.any?
      render_ok
    else
      render json: errors, status: :bad_request
    end
  end

  def destroy
    @platform = ::Db::Novel::Release::Platform.find(params[:id])
    errors = ErrorMessage.new

    @platform.destroy || errors.add!(@platform.errors)

    unless errors.any?
      render_ok
    else
      render json: errors, status: :bad_request
    end
  end

private

  def create_platform_params
    params.permit(:platform)
  end

  def update_platform_params
    params.permit(:platform)
  end
end
