# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class CreateRecipient < Base
        attribute :establishment_id, Types::Coercible::String
        attribute :is_recipient_to_production, Types::Params::Bool.optional.default(false)
        attribute :recipient_name_abbreviated, Types::Coercible::String
        attribute :recipient_name, Types::Coercible::String
        attribute :document_number, Types::Coercible::String
        attribute :business_name, Types::Coercible::String
        attribute :mcc, Types::Coercible::Integer
        attribute :partner_stone_id, Types::Coercible::Integer.optional.default(nil)

        attribute :anticipation, Anticipation.optional.default(nil)
        attribute :address, Address
        attribute :bank, Bank
        attribute :contact, ContactRecipient.optional.default(nil)
        attribute :responsible, ResponsibleRecipient.optional.default(nil)
      end
    end
  end
end
