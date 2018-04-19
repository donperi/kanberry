class Api::V1::Exceptions::HttpException < StandardError
  attr_reader :status, :data

  def initialize(message, status, data = {})
    @status = status
    @data = data
    super(message)
  end

  def to_json
    {
      message: message,
      status: status,
      data: data,
    }
  end
end