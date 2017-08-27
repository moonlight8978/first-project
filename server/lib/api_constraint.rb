class ApiConstraint
  def initialize(version)
    @version = version
  end

  def matches?(request)
    request
      .headers
      .fetch(:accept)
      .include?("version=#{@version}")
  end
end