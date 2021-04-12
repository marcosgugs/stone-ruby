# frozen_string_literal: true

module Stone::Siclos
  module Client
    class ClaimCheck < Base
      def create(data)
        request(:post, '/claim-check/create', data)
      end

      def consult(claim_check_id)
        request(:get, '/claim-check/consult', claim_check_id)
      end

      def delete(claim_check_id)
        request(:delete, '/claim-check/delete', claim_check_id)
      end
    end
  end
end
