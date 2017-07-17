class ReleaseService::AddReleaseToNovel
  def initialize(novel_id, release_id)
    @novel = Db::Novel
      .includes(:releases)
      .find(novel_id)
    @release = Db::Novel::Release.find(release_id)
    @errors = ErrorMessage.new
  end

  def perform
    if @novel.releases.include?(@release)
      # Can raise NameError when :message_from_server key exists
      @errors.add!(message_from_server: 'Target is already exists in collection!')
      return self
    else
      @novel.releases << @release
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
