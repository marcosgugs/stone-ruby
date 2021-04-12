# frozen_string_literal: true

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
      attr_reader :data
      attr_reader :code

      def initialize(code, data)
        @code = code
        @data = JSON.parse(data, symbolize_names: true)
        raise_exception unless @data[:success]
      end

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
      def initialize(token = Stone.config.siclos.api_key)
        @token = token
      end

      def parse_endpoint(path)
        path = path[1..-1] if path.starts_with?('/')
        endpoint = Stone.config.siclos.api_endpoint
        endpoint = "#{endpoint}/" unless endpoint.end_with?('/')
        URI.join(endpoint, path)
      end

      def remove_blank_values(data)
        object = data.respond_to?(:attributes) ? data.attributes : data
        object.each_with_object({}) do |(k, v), new_hash|
          unless v.blank? && v != false
            if v.respond_to?(:attributes)
              new_hash[k] = remove_blank_values(v.attributes)
              next
            end

            new_hash[k] = v.is_a?(Hash) ? remove_blank_values(v) : v
          end
        end
      end

      def request(method, path, data = nil, params = nil)
        response = Typhoeus::Request.new(
          parse_endpoint(path),
          method: method,
          body: data ? remove_blank_values(data).to_json : nil,
          params: params,
          headers: { 'Content-Type': 'application/json', Authorization: "Bearer #{@token}" }
        ).run
        Response.new(response.response_code, response.response_body)
      end
    end

    class << self
      attr_reader :authentication_token

      def token
        @token ||= Token.new
      end

      def establishment
        @establishment ||= Establishment.new(@authentication_token)
      end

      def recipient
        @recipient ||= Recipient.new(@authentication_token)
      end

      def pos
        @pos ||= Pos.new(@authentication_token)
      end

      def pre_transaction
        @pre_transaction ||= PreTransaction.new(@authentication_token)
      end

      def transaction
        @transaction ||= Transaction.new(@authentication_token)
      end

      def finance
        @finance ||= Finance.new(@authentication_token)
      end

      def danfe
        @danfe ||= Danfe.new(@authentication_token)
      end

      def claim_check
        @claim_check ||= ClaimCheck.new(@authentication_token)
      end

      def webhook
        @webhook ||= Webhook.new(@authentication_token)
      end

      def with_token
        token_result = token.token
        raise Stone::Siclos::Error::TokenError, token_result.data[:msg] unless token_result.success?

        @authentication_token = token_result.data[:token]
        result = yield(self)
        result
      end
    end
  end
end
