# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class CreateEstablishmentExisting < Base
        attribute :is_establishment_to_production, Types::Params::Bool.optional.default(false)
        attribute :legal_name, Types::Coercible::String
        attribute :business_name, Types::Coercible::String
        attribute :document_number, Types::Coercible::String
        attribute :stone_code, Types::Coercible::String
        attribute :cards_rate, Types::Coercible::Array.of(CardRate).optional.default(nil)
        attribute :address, Address
      end
    end
  end
end
