# frozen_string_literal: true

module Stone::Siclos
  module Client
    class Establishment < Base
      def create(data)
        request(:post, '/establishment/create', data)
      end

      def create_existing_stone(data)
        request(:post, '/establishment/create-existing-stone', data)
      end

      def deactivate_establishment(id)
        request(:delete, "/establishment/deactivate-establishment/#{id}")
      end

      def reactivate_establishment(data)
        request(:put, '/establishment/reactivate-establishment/', data)
      end

      def get_all
        request(:get, '/establishment/get-all')
      end

      def get_single(id)
        request(:get, "/establishment/get-single/#{id}")
      end
    end
  end
end
