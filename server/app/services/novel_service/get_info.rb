class NovelService::GetInfo
  def initialize(novel_id)
    @novel_id = novel_id
  end

  def perform(full_info: false)
    if full_info
      @novel = Db::Novel
        .includes(
          :tags, :screenshots, { people: :country },
          { character_novels: [{ people: :country }, :character] },
          { releases: [{ developers: :country }, { publishers: :country }] }
        )
        .find(@novel_id)
      @novel.full_info = true

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
    return unless @novel.characters
    @novel.characters_grouped = GroupSerializeService
      .new(@novel.character_novels, Api::V1::Db::Novel::CharacterNovelSerializer)
      .perform { |e| e.character.role }
      .result
  end

  def group_staffs
    return unless @novel.staffs
    positions = {
      'staff'    => :staffs,
      'vocals'   => :vocals,
      'composer' => :composers,
      'artist'   => :artists,
      'scenario' => :scenarios
    }
    @novel.staffs_grouped = GroupSerializeService
      .new(@novel.staffs, Api::V1::Db::Novel::StaffSerializer, positions)
      .perform(&:position)
      .result
  end

  def get_producers
    return unless @novel.releases
    get_producers_svc = NovelService::GetProducers.new(@novel)
    @novel.producers = { publishers: [], developers: [] }

    if @novel.releases
      @novel.producers[:publishers] = get_producers_svc
        .perform(:publishers, serialize: true)
        .result
      @novel.producers[:developers] = get_producers_svc
        .perform(:developers, serialize: true)
        .result
    end
  end
end
