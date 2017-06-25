class NovelService::GetInfo
  def initialize(novel_id)
    @novel_id = novel_id
  end

  def perform(full_info: false)
    if full_info
      @novel = Db::Novel
        .includes(
          :tags, :screenshots, :people,
          { characters: { people: :country } },
          { releases: [{ developers: :country }, { publishers: :country }] }
        )
        .find(@novel_id)
      @novel.full_info = true

      group_characters
      group_staffs
      get_producers
    else
      @novel = ::Vndb::Novel.find(@novel_id)
    end

    self
  end

  def result
    @novel
  end

private

  def group_characters
    roles = {
      0 => :protagonist,
      1 => :main,
      2 => :side
    }
    @novel.characters_grouped = GroupSerializeService
      .new(@novel.characters, :role, roles, Api::V1::Vndb::Novel::CharacterSerializer)
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
      .new(@novel.staffs, :position, positions, Api::V1::Vndb::Novel::StaffSerializer)
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
