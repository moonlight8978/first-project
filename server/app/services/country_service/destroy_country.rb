class CountryService::DestroyCountry < ApplicationService
  def initialize(c_id)
    @country = ::Country.find(c_id)
    super()
  end

  def perform
    @country.destroy
    @country.errors.any? && errors_occurred(@country.errors)

    self
  end
end
