class ReleaseService::UpdateRelease
  def initialize(release_id, release_params)
    @release = Db::Novel::Release
      .includes(:platform)
      .find(release_id)
    @params = release_params
    @errors = ErrorMessage.new
  end

  def perform
    @release.assign_attributes(@params)

    if @release.changed?
      @release.save || @errors.add!(@release.errors)
    else
      begin
        @errors.add!(message: 'Everything is fine, but your data seem not to be changed at all!')
      rescue NameError
        @errors.add!(message_from_server: 'Everything is fine, but your data seem not to be changed at all!')
      end
    end

    self
  end

  def errors?
    @errors.any?
  end

  def errors
    @errors.detail
  end
end
