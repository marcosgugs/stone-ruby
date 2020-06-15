module Stone::Siclos
  module Client
    class Danfe < Base

      def create data
        request(:post, "/danfe/create", data)
      end

      def consult danfe_id
        request(:get, "/danfe/consult", danfe_id)
      end

      def delete danfe_id
        request(:delete, "/danfe/delete", danfe_id)
      end

    end
  end
end
