class Api::V1::Vndb::PublicationsController < ApplicationController
  def index
    render_unauthorized and return unless params[:type].present?

    @novel = ::Vndb::Novel.find(params[:novel_id])
    if valid_type(params[:type])
      get_producers_svc = VndbService::Novel::GetProducers.new(@novel, params[:type])
      get_producers_svc.perform
      @companies = get_producers_svc.results
  
      render json: @companies, key_transform: :camel_lower, status: :ok,
        each_serializer: Api::V1::Vndb::Novel::PublicationSerializer
    else
      render_unauthorized
    end
  end


private
  def valid_type(type)
    valid_types = ['publishers', 'developers']
    valid_types.include?(type)
  end
end
