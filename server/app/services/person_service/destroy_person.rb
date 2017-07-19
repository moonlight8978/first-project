class PersonService::DestroyPerson < ApplicationService
  def initialize(p_id)
    @person = ::Db::Person
      .includes(:voice_actresses, :staffs)
      .find(p_id)
    super()
  end

  def perform
    @person.destroy
    @person.errors.any? && errors_occurred(@person.errors)

    self
  end
end
