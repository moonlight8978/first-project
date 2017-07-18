class Api::V1::Db::Novels::StaffsController < ApplicationController
  def index
    novel = ::Db::Novel.includes(people: :country).find(params[:novel_id])
    @staffs = GroupSerializeService
      .new(novel.staffs, :position, Api::V1::Db::Novel::StaffSerializer, positions)
      .perform
      .result

    render json: @staffs, status: :ok
  end

  def create
    create_svc = NovelStaffService::CreateStaff
      .new(params[:novel_id], params[:no_alias], create_staff_params)
      .perform

    unless create_svc.errors?
      render_ok
    else
      render json: create_svc.errors, status: create_svc.errors[:http_status]
    end
  end

  def update
    update_svc = NovelStaffService::UpdateStaff
      .new(params[:id], params[:no_alias], update_staff_params)
      .perform

    unless update_svc.errors?
      render_ok
    else
      render json: update_svc.errors, status: update_svc.errors[:http_status]
    end
  end

  def destroy
    @staff = ::Db::Novel::Staff.find(params[:id])

    begin
      @staff.destroy!
    rescue ActiveRecord::RecordNotDestroyed => e
      @errors = ErrorMessage.new(e.record.errors)
    end

    if @errors && @errors.any?
      render json: @errors.detail, status: :bad_request
    else
      render_ok
    end
  end

private

  def create_staff_params
    params.permit(:person_id, :position, :note, :alias, :alias_en)
  end

  def update_staff_params
    params.permit(:position, :note, :alias, :alias_en)
  end
end
