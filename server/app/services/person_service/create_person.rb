class PersonService::CreatePerson < ApplicationService
  def initialize(params)
    @params = params
    super()
  end

  def perform
    @person = ::Db::Person.create(@params)
    @person.errors.any? && errors_occurred(@person.errors)

    self
  end
end
