class NovelService::AddCharacter
  def initialize(novel_id, character_params)
    @novel = Db::Novel.find(novel_id)
    @params = character_params
    @errors = ErrorMessage.new
  end

  def perform
    character = @novel.characters.create(@params)
    @errors.add!(character.errors) if character.errors.any?
    self
  end

  def errors?
    @errors.any?
  end

  def errors
    @errors.detail
  end
end
