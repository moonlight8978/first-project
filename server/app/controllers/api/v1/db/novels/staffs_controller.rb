class Api::V1::Db::Novels::StaffsController < ApplicationController
  def index
    positions = {
      'Staff'    => :staffs,
      'Vocals'   => :vocals,
      'Composer' => :composers,
      'Artist'   => :artists,
      'Scenario' => :scenarios
    }

    novel = ::Db::Novel.includes(people: :country).find(params[:novel_id])
    @staffs = GroupSerializeService
      .new(novel.staffs, :position, Api::V1::Db::Novel::StaffSerializer, positions)
      .perform
      .result

    render json: @staffs, status: :ok
  end

  def create

  end

  def update

  end

  def destroy

  end
end
