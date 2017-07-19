class ApplicationService
  attr_accessor :errors

  def initialize
    @errors = ErrorMessage.new
  end

  def errors?
    @errors.any?
  end

private

  def errors_occurred(errors)
    @errors.add!(errors)
    @errors.set_status(:bad_request)
  end
end
