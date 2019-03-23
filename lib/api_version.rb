class ApiVersion
  def initialize(version:, default: false)
    @version, @default = version, default
  end

  def matches?(request)
    @default || check_header(request.headers)
  end

  private

  def check_header(headers)
    accept = headers["Accept"]
    accept = accept.include?(media_type)
  end

  def media_type
    "application/vnd.todo.#{@version}"
  end
end
