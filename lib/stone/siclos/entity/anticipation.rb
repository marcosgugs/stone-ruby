# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class Anticipation < Base
        attribute :is_automatic, Types::Params::Bool.optional.default(false)
        attribute :automatic_rate, Types::Coercible::Float.optional.default(0)
        attribute :spot_rate, Types::Coercible::Float.optional.default(0)
      end
    end
  end
end
