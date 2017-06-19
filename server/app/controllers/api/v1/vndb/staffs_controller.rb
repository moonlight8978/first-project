class Api::V1::Vndb::StaffsController < ApplicationController
  POSITIONS = {
    'Staff'    => :staffs,
    'Vocals'   => :vocals,
    'Composer' => :composers,
    'Artist'   => :artists,
    'Scenario' => :scenarios
  }

  def index_novel
    novel = ::Vndb::Novel.includes(:people).find(params[:novel_id])
    staffs_need_to_serialize = novel.staffs.group_by(&:position)
    @staffs = GroupSerializeService
      .new(staffs_need_to_serialize, POSITIONS, Api::V1::Vndb::Novel::StaffSerializer)
      .perform
      .result

    render json: @staffs, status: :ok
  end

  def create_novel

  end

  def destroy_novel

  end

  def index_person
    @person = ::Vndb::Person.includes({ novels: :releases }, :country)
      .find(params[:person_id])
    @credits = @person.staffs.sort_by do |staff|
      staff.novel.first_release.released
    end

    paginate json: @credits, key_transform: :camel_lower, status: :ok,
      per_page: params[:per_page],
      each_serializer: Api::V1::Vndb::Person::CreditSerializer
  end
end
