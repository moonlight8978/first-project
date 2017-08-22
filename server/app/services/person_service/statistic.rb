class PersonService::Statistic < ApplicationService
  def initialize(person)
    @person = person
    super()
  end

  def perform
    @person.staff_statistics = PersonService::StaffStatistic
      .new(@person)
      .perform
    @person.voice_actress_statistics = PersonService::VoiceActressStatistic
      .new(@person)
      .perform
  end
end
