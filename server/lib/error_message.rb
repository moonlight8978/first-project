class ErrorMessage
  def initialize(errors = {})
    @errors = errors
  end

  def any?
    @errors.present?
  end

  def detail
    @errors
  end

  def add!(**errors)
    errors.map do |error_key, error_detail|
      if @errors.key?(error_key)
        raise NameError.new('Key already exists!')
      else
        @errors[error_key] = error_detail
      end
    end
  end
end
