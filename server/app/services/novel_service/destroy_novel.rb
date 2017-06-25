class NovelService::DestroyNovel
  attr_accessor :novel

  def initialize(novel)
    @novel = novel
    @error = false
  end

  def perform
    @novel.releases.destroy_all
    @novel.staffs.destroy_all
    @novel.characters.destroy_all
    @novel.destroy
  end

  def error?
    @error
  end
end
