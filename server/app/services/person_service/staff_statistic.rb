class PersonService::StaffStatistic < ApplicationService
  def initialize(person)
    @person = person
    super()
  end

  def perform
    initial_statistics = {}
    with_released = @person.staffs.reject do |staff|
      staff.novel.first_release.nil?
    end
    
    return nil if with_released.size == 0
    
    # else
    statistics_hash = with_released.group_by_year do |staff|
      staff.novel.first_release.released
    end
    
    statistics_array = statistics_hash.map { |key, value| key.year }
    year_range = (statistics_array.first .. statistics_array.last).to_a
    year_range.each do |year|
      initial_statistics[year] = 0
    end
    
    statistics_hash = statistics_hash.map do |first_day_of_year, staffs|
      [first_day_of_year.year, staffs.size]
    end.to_h
    
    initial_statistics.merge(statistics_hash).map do |year, total|
      { year: year.to_s, total: total }
    end
  end
end
