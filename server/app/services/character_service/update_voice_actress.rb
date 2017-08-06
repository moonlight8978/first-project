class CharacterService::UpdateVoiceActress
  def initialize(voice_actress_id, params = {}, no_alias: true)
    # In Rails 5, belongs_to is required by default
    # Preload belongs_to
    @va = Db::Novel::Character::VoiceActress
      .includes(:person, :character_novel)
      .find(voice_actress_id)
    @params = params
    @no_alias = no_alias
    @errors = ErrorMessage.new
  end

  def perform
    @va.assign_attributes(@params)
    @va.assign_attributes(alias: nil, alias_en: nil) if @no_alias

    if @va.changed?
      @va.save || @errors.add!(@va.errors)
    else
      begin
        @errors.add!(message: 'Everything is fine, but your data seem not to be changed at all!')
      rescue NameError
        @errors.add!(message_from_server: 'Everything is fine, but your data seem not to be changed at all!')
      end
    end

    self
  end

  def result
    @va
  end

  def errors?
    @errors.any?
  end

  def errors
    @errors.detail
  end
end
