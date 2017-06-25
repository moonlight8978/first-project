class Api::V1::Db::CompaniesController < ApplicationController
  def index
    @companies = ::Db::Company.all

    paginate json: @companies, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Database::Company::CompanySerializer
  end

  def show
    @company = ::Db::Company.find(params[:id])

    render json: @company, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Database::Company::CompanySerializer
  end

  def create

  end

  def update

  end

  def destroy

  end
end
