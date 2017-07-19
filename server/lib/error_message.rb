class ErrorMessage
  attr_accessor :status
  attr_accessor :errors; alias_method :detail, :errors

  def initialize(errors = {})
    @errors = errors
  end

  def any?
    @errors.present?
  end

  def add!(override = false, **errors)
    errors.map do |error_key, error_detail|
      if @errors.key?(error_key) && !override
        raise NameError.new('Key already exists!')
      elsif @errors.key?(error_key) && override
        arr = Array(@errors[error_key])
        arr.push(error_detail)
        @errors[error_key] = arr
      else
        @errors[error_key] = error_detail
      end
    end
  end

  def set_status(http_status)
    @errors[:http_status] = http_status
    @status = http_status
  end

  def full_message
    @errors.values.flatten
  end
end
