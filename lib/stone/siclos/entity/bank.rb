# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class Bank < Base
        attribute :bank_code, Types::Coercible::String.optional.default(nil)
        attribute :agency, Types::Coercible::String.optional.default(nil)
        attribute :agency_dv, Types::Coercible::String.optional.default(nil)
        attribute :account, Types::Coercible::String.optional.default(nil)
        attribute :account_dv, Types::Coercible::String.optional.default(nil)
        attribute :account_type, Types::Coercible::String.optional.default(nil)
      end
    end
  end
end
