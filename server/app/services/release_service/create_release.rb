class ReleaseService::CreateRelease
  def initialize(novel_id, release_params)
    @novel = Db::Novel.find(novel_id)
    @params = release_params
    @errors = ErrorMessage.new
  end

  def perform
    @release = @novel.releases.create(@params)
    @errors.add!(@release.errors) if @release.errors.any?

    self
  end

  def errors?
    @errors.any?
  end

  def errors
    @errors.detail
  end
end
