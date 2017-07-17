class CharacterService::AddCharacterToNovel
  def initialize(novel_id, character_id)
    @novel = Db::Novel.includes(:characters).find(novel_id)
    @character = Db::Novel::Character.find(character_id)
    @errors = ErrorMessage.new
  end

  def perform
    unless @novel.characters.include? (@character)
      @novel.characters << @character
      if @novel.errors.any?
        @errors.add!(@novel.errors)
        @errors.set_status(:bad_request)
      end
    else
      @errors.add!(character: 'Character is already in novel\'s collections')
      @errors.set_status(:conflict)
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
