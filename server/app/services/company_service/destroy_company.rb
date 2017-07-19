class CompanyService::DestroyCompany < ApplicationService
  def initialize(c_id)
    @company = ::Db::Company.find(c_id)
    super()
  end

  def perform
    @company.destroy
    @company.errors.any? && errors_occurred(@company.errors)

    self
  end
end
