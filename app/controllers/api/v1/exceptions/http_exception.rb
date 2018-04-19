module Api::V1
  module Exceptions
    class HttpException < StandardError
      attr_reader :status, :detail, :data

      def initialize(message, status, detail,  data = {})
        @status = status
        @detail = detail
        @data = data

        super(message)
      end

      def as_json(options = {})
        {
          error: message,
          status: status,
          message: detail,
          data: data,
        }
      end

      def self.bad_request(detail, data = {})
        self.new("Bad Request", 400, detail, data)
      end

      def self.unauthorized(detail, data = {})
        self.new("Unauthorized", 402, detail, data)
      end
    end
  end
 end