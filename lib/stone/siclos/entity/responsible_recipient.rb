# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class ResponsibleRecipient < Base
        attribute :name, Types::Coercible::String
        attribute :cell_phone, Types::OnlyNumbersString.optional.default(nil)
        attribute :document_number, Types::Coercible::String.optional.default(nil)
        attribute :name, Types::Coercible::String.optional.default(nil)
      end
    end
  end
end
