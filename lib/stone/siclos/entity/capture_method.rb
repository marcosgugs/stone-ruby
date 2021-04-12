# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class CaptureMethod < Base
        attribute :amount_of_s920, Types::AmountFormatted.optional.default(nil)
        attribute :mobile_carrier_id, Types::Coercible::Integer.optional.default(nil)
        attribute :monthly_fee, Types::AmountFormatted.optional.default(nil)
        attribute :initial_exemption_days, Types::Coercible::Integer.optional.default(nil)
      end
    end
  end
end
