class Api::V1::Vndb::CompaniesController < ApplicationController
  def index
    @companies = ::Vndb::Company.all

    paginate json: @companies, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Company::CompanySerializer
  end

  def show
    @company = ::Vndb::Company.find(params[:id])

    render json: @company, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Company::CompanySerializer
  end

  def create

  end

  def update

  end

  def destroy

  end

  def index_published

  end

  def index_developed

  end
end
