module Api::V1
  class Response
    attr_reader :data, :message, :status, :meta

    def initialize(data: {}, message: "Success!", status: 200,  meta: {})
      @data = data
      @message = message
      @status = status
      @meta = meta
    end

    def as_json(options = {})
      {
        status: status,
        message: message,
        data: data,
        data_type: data.class.name.downcase,
        meta: meta,
      }
    end
  end
end