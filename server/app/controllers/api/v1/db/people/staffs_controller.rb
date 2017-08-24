class Api::V1::Db::People::StaffsController < ApplicationController
  def index
    @person = ::Db::Person
      .includes(staffs: { novel: :releases })
      .find(params[:person_id])
    @staffs = Kaminari
      .paginate_array(@person.staffs.sort_date)
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)

    render json: @staffs, key_transform: :camel_lower, status: :ok,
      each_serializer: Api::V1::Db::Person::StaffSerializer
  end
end
