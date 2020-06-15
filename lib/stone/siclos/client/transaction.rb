module Stone::Siclos
  module Client
    class Transaction < Base

      def single_siclos siclos_transaction_id
        request(:get, "/transactions/single/siclos/#{siclos_transaction_id}")
      end

      def single_stone stone_transaction_id
        request(:get, "/transactions/single/stone/#{stone_transaction_id}")
      end

      def single_pre_transaction pre_transaction_id
        request(:get, "/transactions/single/pre-transaction/#{pre_transaction_id}")
      end

      def list_provider data
        request(:post, "/transactions/list/provider", data)
      end

    end
  end
end
