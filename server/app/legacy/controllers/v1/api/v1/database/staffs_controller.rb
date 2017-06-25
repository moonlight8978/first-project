class Api::V1::Database::StaffsController < ApplicationController
  def index_person
    @person = ::Database::Person.includes({ novels: :releases }, :country)
      .find(params[:person_id])
    @credits = @person.staffs.sort_by do |staff|
      staff.novel.first_release.released
    end

    paginate json: @credits, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Database::Person::CreditSerializer
  end
end
