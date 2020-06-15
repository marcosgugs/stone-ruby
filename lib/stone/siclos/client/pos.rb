module Stone::Siclos
  module Client
    class Pos < Base

      def control_configuration data
        request(:post, "/pos/control-configuration", data)
      end

      def get_control_configuration establishment_id
        request(:get, "/pos/control-configuration/#{establishment_id}")
      end

      def get_available_pos establishment_id
        request(:get, "/pos/get-available-pos/#{establishment_id}")
      end

      def activate_pos_link data
        request(:post, "/pos/active-pos-link", data)
      end

      def deactivate_pos_link pos_reference_id
        request(:put, "/pos/deactivate-pos-link", pos_reference_id)
      end

    end
  end
end
