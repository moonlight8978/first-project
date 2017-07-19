class CountryService::UpdateCountry < ApplicationService
  include UpdateService

  def initialize(c_id, params)
    @country = ::Country.find(c_id)
    @params = params
    super()
  end

  def perform
    @country.assign_attributes(@params)

    if @country.changed?
      @country.save || errors_occurred(@country.errors)
    else
      nothing_changed
    end

    self
  end
end
