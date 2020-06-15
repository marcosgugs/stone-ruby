module Stone::Siclos
  module Client


    class Response
      def initialize(code, data)
        @code = code
        ap data
        @data = JSON.parse(data, symbolize_names: true)
        raise_exception unless @data[:success]
      end
      attr_reader :data
      attr_reader :code

      def success?
        @data[:success]
      end

      private
      def raise_exception
        return unless Stone.config.siclos.use_exception

        raise Stone::Siclos::Error, "#{@data[:error]} - #{@data[:msg]}"
      end
    end

    class Base

      def initialize
        @token = Stone.config.siclos.api_key
      end

      def parse_endpoint(path)
        path = path[1..-1] if path.starts_with?('/')
        endpoint = Stone.config.siclos.api_endpoint
        endpoint = "#{endpoint}/" unless endpoint.end_with?('/')
        URI.join(endpoint, path)
      end

      def request(method, path, data = nil, params = nil)
        response = Typhoeus::Request.new(
          parse_endpoint(path),
          method: method,
          body: data ? data.to_json : nil,
          params: params,
          headers: {
            :'Content-Type'=> 'application/json',
            :Authorization => "Bearer #{@token}"
          }
        ).run
        Response.new(response.response_code, response.response_body)
      end
    end

    class << self

    end
  end
end
