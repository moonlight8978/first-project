class CharacterService::CreateVoiceActress
  def initialize(character_novel_id, person_id, params = {})
    @character_novel = Db::Novel::CharacterNovel
      .find(character_novel_id)
    @params = params
    @errors = ErrorMessage.new
    @person = ::Db::Person.find(person_id)
  end

  def perform
    exists = @character_novel.people.include?(@person)

    if @person.present? && !exists
      @voice_actress = @character_novel.voice_actresses.build(person: @person)
    elsif @person.present? && exists
      @errors.add!(person_already_exist: 'This character is already voiced by #{@person.name}')
      return self
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

  def result
    @voice_actress
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
