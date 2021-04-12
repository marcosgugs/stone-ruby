# frozen_string_literal: true

module Stone::Siclos
  module Client
    class Recipient < Base
      def create(data)
        request(:post, '/recipient/create', data)
      end

      def create_existing_stone(data)
        request(:post, '/recipient/create-existing-stone', data)
      end

      def deactivate_recipient(recipient_id)
        request(:delete, "/recipient/deactivate-recipient/#{recipient_id}")
      end

      def reactivate_recipient(data)
        request(:put, '/recipient/reactivate-recipient/', data)
      end

      def get_all_establishment_recipients
        request(:get, "/recipient/get-all-establishment-recipients/#{establishment_id}")
      end

      def get_single(recipient_id)
        request(:get, "/recipient/get-single/#{recipient_id}")
      end
    end
  end
end
