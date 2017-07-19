class PersonService::UpdatePerson < ApplicationService
  include UpdateService

  def initialize(p_id, params)
    @person = ::Db::Person.find(p_id)
    @params = params
    super()
  end

  def perform
    @person.assign_attributes(@params)

    if @person.changed?
      @person.save || errors_occurred(@person.errors)
    else
      nothing_changed
    end

    self
  end
end
