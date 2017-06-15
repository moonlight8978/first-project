class Api::V1::Vndb::CompaniesController < ApplicationController
  def show
    @company = ::Vndb::Company.find(params[:id])
    render json: @company, key_transform: :camel_lower, status: :ok,
      serializer: Api::V1::Vndb::Company::CompanySerializer
  end

  def novels
    render_unauthorized and return unless params[:type].present?
    @company = ::Vndb::Company.find(params[:id])
    if params[:type] == 'publisheds'
      @novels = @company.publisheds
    elsif params[:type] == 'developeds'
      @novels = @company.developeds
    end
    # .map do |published|
    #   published.novel
    # end
    render json: @novels, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Vndb::Company::ReleaseSerializer
  end
end
