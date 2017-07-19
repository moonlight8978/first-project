class CompanyService::UpdateCompany < ApplicationService
  include UpdateService

  def initialize(c_id, params)
    @company = ::Db::Company.find(c_id)
    @params = params
    super()
  end

  def perform
    @company.assign_attributes(@params)

    if @company.changed?
      @company.save || errors_occurred(@company.errors)
    else
      nothing_changed
    end

    self
  end
end
