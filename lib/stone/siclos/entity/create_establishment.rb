# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class CreateEstablishment < Base
        attribute :is_establishment_to_production, Types::Params::Bool.optional.default(false)
        attribute :legal_name, Types::Coercible::String
        attribute :business_name, Types::Coercible::String
        attribute :document_number, Types::OnlyNumbersString
        attribute :tpv, Types::AmountFormatted
        attribute :mcc, Types::Coercible::Integer
        attribute :email_access_stone, Types::Coercible::String
        attribute :cell_phone, Types::OnlyNumbersString.optional.default(nil)
        attribute :partner_stone_id, Types::Coercible::Integer.optional.default(nil)

        attribute :capture_method, CaptureMethod
        attribute :responsible, Responsible.optional.default(nil)
        attribute :contact, Contact.optional.default(nil)
        attribute :anticipation, Anticipation.optional.default(nil)
        attribute :cards_rate, Types::Coercible::Array.of(CardRate)

        attribute :address, Address
        attribute :bank, Bank
      end
    end
  end
end
