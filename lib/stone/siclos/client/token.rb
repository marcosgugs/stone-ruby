# frozen_string_literal: true

module Stone::Siclos
  module Client
    class Token < Base
      def token
        request(:get, '/token')
      end
    end
  end
end
