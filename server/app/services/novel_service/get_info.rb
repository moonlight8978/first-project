class NovelService::GetInfo
  def initialize(novel_id)
    @novel_id = novel_id
  end

  def perform(full_info: false)
    if full_info
      @novel = Db::Novel
        .includes(
          :tags, :screenshots,{ people: :country },
          { characters: { people: :country } },
          { releases: [{ developers: :country }, { publishers: :country }] }
        )
        .find(@novel_id)
      @novel.full_info = true
      @novel.characters.map do |character|
        character.voice_actresses_in_novel = character.voice_actresses.in_novel(@novel.id)
      end

      group_characters
      group_staffs
      get_producers
    else
      @novel = Db::Novel
        .includes(releases: [{ developers: :country }, { publishers: :country }])
        .find(@novel_id)

      get_producers
    end

    self
  end

  def result
    @novel
  end

private

  def group_characters
    @novel.characters_grouped = GroupSerializeService
      .new(@novel.characters, :role, Api::V1::Db::Novel::CharacterSerializer)
      .perform
      .result
  end

  def group_staffs
    positions = {
      'Staff'    => :staffs,
      'Vocals'   => :vocals,
      'Composer' => :composers,
      'Artist'   => :artists,
      'Scenario' => :scenarios
    }
    @novel.staffs_grouped = GroupSerializeService
      .new(@novel.staffs, :position, Api::V1::Db::Novel::StaffSerializer, positions)
      .perform
      .result
  end

  def get_producers
    get_producers_svc = NovelService::GetProducers.new(@novel)
    @novel.producers = { publishers: [], developers: [] }

    @novel.producers[:publishers] = get_producers_svc
      .perform(:publishers, serialize: true)
      .result
    @novel.producers[:developers] = get_producers_svc
      .perform(:developers, serialize: true)
      .result
  end
end
