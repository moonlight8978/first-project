class NovelStaffService::CreateStaff
  def initialize(novel_id, no_alias, params)
    @novel = ::Db::Novel.find(novel_id)
    ::Db::Person.find(params[:person_id])
    @params = params
    @errors = ErrorMessage.new
    @no_alias = no_alias
  end

  def perform
    exists = @novel.staffs.exists?(person_id: @params[:person_id],
                                  position:  @params[:position])
    if exists
      already_exists
    else
      @staff = @novel.staffs.build(@params)
      @no_alias && @staff.assign_attributes(alias: nil, alias_en: nil)
      @staff.save || has_error
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

  def already_exists
    @errors.add!(message_from_server: 'Staff is already exists')
    @errors.set_status(:conflict)
  end
end
