class CountryService::CreateCountry < ApplicationService
  def initialize(params)
    @params = params
    super()
  end

  def perform
    @country = ::Country.create(@params)
    @country.errors.any? && errors_occurred(@country.errors)

    self
  end
end
