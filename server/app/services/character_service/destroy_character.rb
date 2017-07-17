class CharacterService::DestroyCharacter
  def initialize(novel_id, character_id)
    @novel = Db::Novel.includes(:characters).find(novel_id)
    @character = Db::Novel::Character
      .includes(character_novels: [:novel, :voice_actresses])
      .find(character_id)
    @errors = ErrorMessage.new
  end

  def perform
    if @novel.characters.include?(@character)
      @character.novels.size == 1 ? destroy : remove
    else
      @errors.add!(message_from_server: 'WTF are you doing?',
                   character: 'Character is not in novel\'s character collection')
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

private

  def destroy
    ActiveRecord::Base.transaction do
      begin
        @character.character_novels.first.voice_actresses.destroy_all
        @character.character_novels.destroy_all
        @character.destroy
      rescue ActiveRecord::Rollback
        destroy_error(@character.errors)
      end
    end
  end

  def remove
    character_novel = @character.character_novels.select do |char|
      char[:character_id] == @character.id && char[:novel_id] == @novel.id
    end.first

    ActiveRecord::Base.transaction do
      begin
        character_novel.voice_actresses.destroy_all
        character_novel.destroy
      rescue ActiveRecord::Rollback
        destroy_error(character_novel.errors)
      end
    end
  end

  def destroy_error(errors)
    @errors.add!(message_from_server: 'Target has not been delete. Error!')
    @errors.add!(errors)
    @errors.set_status(:bad_request)
  end
end
