module Stone::Siclos
  module Client
    class Webhook < Base

      def pre_transaction_status data
        request(:post, "/webhook/pre-transaction-status", data)
      end

      def processed_transaction data
        request(:post, "/webhook/processed-transaction", data)
      end

      def status_split data
        request(:post, "/webhook/status-split", data)
      end

      def print_note_status data
        request(:post, "/webhook/print-note-status", data)
      end

      def enabled_split data
        request(:post, "/webhook/enabled-split", data)
      end

      def pos_application data
        request(:post, "/webhook/pos-application", data)
      end

      def webhook
        request(:get, "/webhook")
      end

    end
  end
end
