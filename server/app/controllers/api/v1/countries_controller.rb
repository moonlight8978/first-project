class Api::V1::CountriesController < ApplicationController
  def index

  end

  def create
    create_svc = CountryService::CreateCountry.new(create_country_params)
      .perform

    unless @create_svc.errors?
      render_ok
    else
      render json: @create_svc.errors.detail, status: @create_svc.errors.status
    end
  end

  def update
    update_svc = CountryService::UpdateCountry
      .new(params[:id], update_country_params)
      .perform

    unless @update_svc.errors?
      render_ok
    else
      render json: @update_svc.errors.detail, status: @update_svc.errors.status
    end
  end

  def destroy
    @destroy_svc = CountryService::DestroyCountry.new(params[:id])
      .perform

    unless @destroy_svc.errors?
      render_ok
    else
      render json: @destroy_svc.errors.detail, status: @destroy_svc.errors.status
    end
  end

private

  def create_country_params
    params.permit(:name, :name_en, :image)
  end

  def update_country_params
    params.permit(:name, :name_en, :image)
  end
end
