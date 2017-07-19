class CompanyService::CreateCompany < ApplicationService
  def initialize(params)
    @params = params
    super()
  end

  def perform
    @company = ::Db::Company.create(@params)
    @company.errors.any? && errors_occurred(@company.errors)

    self
  end
end
