# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class CreateRecipientExisting < Base
        attribute :establishment_id, Types::Coercible::String
        attribute :is_recipient_to_production, Types::Params::Bool.optional.default(false)
        attribute :recipient_name, Types::Coercible::String
        attribute :document_number, Types::Coercible::String
        attribute :business_name, Types::Coercible::String
        attribute :stone_code, Types::Coercible::String

        attribute :address, Address
      end
    end
  end
end
