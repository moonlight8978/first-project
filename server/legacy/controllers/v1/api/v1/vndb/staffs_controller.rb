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
end
