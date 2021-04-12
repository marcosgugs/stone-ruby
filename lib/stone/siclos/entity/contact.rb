# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class Contact < Base
        attribute :name, Types::Coercible::String.optional.default(nil)
        attribute :cell_phone, Types::OnlyNumbersString.optional.default(nil)
        attribute :phone, Types::OnlyNumbersString.optional.default(nil)
      end
    end
  end
end
