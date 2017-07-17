class ReleaseService::DestroyRelease
  def initialize(novel_id, release_id)
    @novel = Db::Novel
      .includes(:releases)
      .find(novel_id)
    @release = Db::Novel::Release
      .includes(:novels)
      .find(release_id)
    @errors = ErrorMessage.new
  end

  def perform
    if @novel.releases.include?(@release)
      @release.novels.size == 1 ? destroy : remove
    else
      @errors.add!(message_from_server: 'WTF are you doing?')
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

  def destroy
    ActiveRecord::Base.transaction do
      begin
        @release.destroy
      rescue ActiveRecord::Rollback
        @errors.add!(true, message_from_server: 'Failed to destroy. Rollback!')
      end
    end
  end

  def remove
    ActiveRecord::Base.transaction do
      begin
        @release.novels.destroy(@novel)
      rescue ActiveRecord::Rollback
        @errors.add!(true, message_from_server: 'Failed to destroy. Rollback!')
      end
    end
  end
end
