class VndbService::Novel::AddCharacter
  def initialize(novel, params)
    @novel = novel
    @params = params
  end

  def perform
    @novel.characters.build(params)
    @novel.save
  end
end