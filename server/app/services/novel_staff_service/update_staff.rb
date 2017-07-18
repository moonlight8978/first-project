class NovelStaffService::UpdateStaff
  def initialize(staff_id, no_alias, params)
    @staff = Db::Novel::Staff
      .includes(:person, :novel)
      .find(staff_id)
    @params = params
    @errors = ErrorMessage.new
    @no_alias = no_alias
  end

  def perform
    @staff.assign_attributes(@params)
    @no_alias && @staff.assign_attributes(alias: nil, alias_en: nil)

    if @staff.changed?
      @staff.save || has_error
    else
      nothing_changed
    end

    self
  end

  def errors?
    @errors.any?
  end

  def errors
    @errors.detail
  end

private

  def has_error
    @errors.add!(@staff.errors)
    @errors.set_status(:bad_request)
  end

  def nothing_changed
    @errors.add!(message_from_server: 'Nothing changed!')
    @errors.set_status(:bad_request)
  end
end
