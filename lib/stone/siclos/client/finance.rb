module Stone::Siclos
  module Client
    class Finance < Base

      def extract data
        request :post, '/finance/extract', data
      end

    end
  end
end
