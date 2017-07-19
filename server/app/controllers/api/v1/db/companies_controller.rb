class Api::V1::Db::CompaniesController < ApplicationController
  def index
    @companies = ::Db::Company.all

    paginate json: @companies, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Company::CompanySerializer
  end

  def show
    @company = ::Db::Company.find(params[:id])

    render json: @company, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Db::Company::CompanySerializer
  end

  def create
    @create_svc = CompanyService::CreateCompany.new(create_company_params)
      .perform

    unless @create_svc.errors?
      render_ok
    else
      render json: @create_svc.errors.detail, status: @create_svc.errors.status
    end
  end

  def update
    @update_svc = CompanyService::UpdateCompany
      .new(params[:id], update_company_params)
      .perform

    unless @update_svc.errors?
      render_ok
    else
      render json: @update_svc.errors.detail, status: @update_svc.errors.status
    end
  end

  def destroy
    @destroy_svc = CompanyService::DestroyCompany
      .new(params[:id])
      .perform

    unless @destroy_svc.errors?
      render_ok
    else
      render json: @destroy_svc.errors.detail, status: @destroy_svc.errors.status
    end
  end

private

  def create_company_params
    params.permit(:name, :name_en, :country_id, :link, :link)
  end

  def update_company_params
    params.permit(:name, :name_en, :country_id, :link, :link)
  end
end
