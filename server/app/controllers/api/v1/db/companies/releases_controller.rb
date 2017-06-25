class Api::V1::Db::Companies::ReleasesController < ApplicationController
  def index_company
    render_unauthorized and return unless params[:type].present?
    @company = ::Db::Company.find(params[:company_id])
    if params[:type] == 'publisheds'
      @novels = @company.publisheds
    elsif params[:type] == 'developeds'
      @novels = @company.developeds
    end

    paginate json: @novels, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Database::Company::ReleaseSerializer
  end
end
