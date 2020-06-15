module Stone::Siclos
  module Client
    class PreTransaction < Base

      def create data
        request(:post, "/pre-transaction/create", data)
      end

      def single pre_transaction_id
        request(:get, "/pre-transaction/single/#{pre_transaction_id}")
      end

      def date data
        request(:post, "/pre-transaction/date", data)
      end

      def delete pre_transaction_id
        request(:delete, "/pre-transaction/delete/#{pre_transaction_id}")
      end

    end
  end
end
