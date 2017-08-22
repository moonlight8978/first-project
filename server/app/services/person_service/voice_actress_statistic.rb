class PersonService::VoiceActressStatistic < ApplicationService
  def initialize(person)
    @person = person
    super()
  end

  def perform
    initial_statistics = {}
    with_released = @person.voice_actresses.reject do |va|
      va.character_novel.novel.first_release.nil?
    end
    
    return nil if with_released.length == 0
    
    # else
    statistics_hash = with_released.group_by_year do |va|
      va.character_novel.novel.first_release.released
    end
    
    statistics_array = statistics_hash.map { |key, value| key.year }
    year_range = (statistics_array.first .. statistics_array.last).to_a
    year_range.each do |year|
      initial_statistics[year] = 0
    end
    
    statistics_hash = statistics_hash.map do |first_day_of_year, vas|
      [first_day_of_year.year, vas.length]
    end.to_h
    
    initial_statistics.merge(statistics_hash).map do |year, total|
      { year: year, total: total }
    end
  end
end
