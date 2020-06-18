module Stone::Siclos
  module Client

    autoload :Token, 'stone/siclos/client/token'
    autoload :Establishment, 'stone/siclos/client/establishment'
    autoload :Recipient, 'stone/siclos/client/recipient'
    autoload :Pos, 'stone/siclos/client/pos'
    autoload :PreTransaction, 'stone/siclos/client/pre_transaction'
    autoload :Transaction, 'stone/siclos/client/transaction'
    autoload :Finance, 'stone/siclos/client/finance'
    autoload :Danfe, 'stone/siclos/client/danfe'
    autoload :ClaimCheck, 'stone/siclos/client/claim_check'
    autoload :Webhook, 'stone/siclos/client/webhook'

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
      def token
        @token ||= Token.new
      end

      def establishment
        @establishment ||= Establishment.new
      end

      def recipient
        @recipient ||= Recipient.new
      end

      def pos
        @pos ||= Pos.new
      end

      def pre_transaction
        @pre_transaction ||= PreTransaction.new
      end

      def transaction
        @transaction ||= Transaction.new
      end

      def finance
        @finance ||= Finance.new
      end

      def danfe
        @danfe ||= Danfe.new
      end

      def claim_check
        @claim_check ||= ClaimCheck.new
      end

      def webhook
        @webhook ||= Webhook.new
      end

      def with_token
        cached_token = Stone.config.siclos.api_key
        authentication_token = token.token

        if authentication_token.success?
          Stone.config.siclos.api_key = authentication_token.data[:token]
          result = yield(self)
          Stone.config.siclos.api_key = cached_token
          result
        else
          raise Stone::Siclos::Error::TokenError, authentication_token.data[:msg]
        end
      ensure
        Stone.config.siclos.api_key = cached_token
      end
    end
  end
end
