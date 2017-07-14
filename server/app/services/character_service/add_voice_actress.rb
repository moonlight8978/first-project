class CharacterService::AddVoiceActress
  def initialize(person_id, novel_id, character_id, params = {})
    @character_novel = Db::Novel::CharacterNovel
      .find_by(character_id: character_id, novel_id: novel_id)
    @params = params
    @errors = ErrorMessage.new
    @person = ::Db::Person.find(person_id)
  end

  def perform
    if @person.present?
      @voice_actress = @character_novel.voice_actresses.build(person: @person)
    else
      @errors.add!(person_not_found: 'Person not found!')
      return self
    end

    @voice_actress.assign_attributes(@params) unless @params.empty?

    unless @character_novel.save
      @errors.add!(@character_novel.errors)
    end

    self
  end

  def results
    @character
  end

  def errors?
    @errors.any?
  end

  def person_not_found?
    errors? && errors.key?(:person_not_found)
  end

  def errors
    @errors.detail
  end
end
