class VndbService::Novel::UpdateNovel
  attr_accessor :novel

  def initialize(novel, params)
    @novel = novel
    @params = params
    @error = false
  end

  def perform
    @novel.assign_attributes(@params)
    @error = true unless @novel.save
  end

  def error?
    @error
  end
end