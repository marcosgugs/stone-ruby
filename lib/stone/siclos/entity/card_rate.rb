# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class CardRate < Base
        attribute :type_id, Types::Coercible::Float.optional.default(nil)
        attribute :visa, Types::Coercible::Float.optional.default(nil)
        attribute :master, Types::Coercible::Float.optional.default(nil)
        attribute :elo, Types::Coercible::Float.optional.default(nil)
        attribute :hiper, Types::Coercible::Float.optional.default(nil)
        attribute :amex, Types::Coercible::Float.optional.default(nil)
      end
    end
  end
end
