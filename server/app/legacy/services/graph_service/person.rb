class GraphService::Person
  def initialize(person)
    @person = person
  end

  def count_voiceds
    @person.characters.group_by_year { |character| character.novel.released }
      .map { |key, value| Hash[year: key.year, total: value.size] }
  end

  def count_credits
    @person.staffs.group_by_year { |staff| staff.novel.released }
      .map { |key, value| Hash[year: key.year, total: value.size] }
  end
end