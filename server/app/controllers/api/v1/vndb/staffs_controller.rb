class Api::V1::Vndb::StaffsController < ApplicationController
  STAFF_POSITION = {
    'Staff'    => 'staffs',
    'Vocals'   => 'vocals',
    'Composer' => 'composers',
    'Artist'   => 'artists',
    'Scenario' => 'scenarios'
  }
  
  def index
    @novel = ::Vndb::Novel.includes(:people).find(params[:novel_id])
    @staffs = @novel.staffs.group_by(&:position)
    @staff_serializers = @staffs.map do |position, staffs|
      [STAFF_POSITION[position], staff_serializer(staffs)]
    end.to_h
    render json: @staff_serializers
  end

private

  def staff_serializer(staffs)
    staffs.map do |staff|
      ActiveModelSerializers::SerializableResource.new(
        staff,
        serializer: Api::V1::Vndb::Novel::StaffSerializer,
        root: false,
        key_transform: :camel_lower
      )
    end
  end
end
