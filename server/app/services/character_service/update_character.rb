class CharacterService::UpdateCharacter
  def initialize(id, params)
    @character = Db::Novel::Character.find(id)
    @errors = ErrorMessage.new
    @params = params
  end

  def perform
    @character.assign_attributes(@params)

    if @character.changed?
      @character.save || @errors.add!(@character.errors)
    else
      begin
        @errors.add!(message: 'Everything is fine, but your data seem not to be changed at all!')
      rescue NameError
        @errors.add!(message_from_server: 'Everything is fine, but your data seem not to be changed at all!')
      end
    end

    self
  end

  def results
    @character
  end

  def errors?
    @errors.any?
  end

  def errors
    @errors.detail
  end
end
