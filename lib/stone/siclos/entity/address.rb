# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class Address < Base
        attribute :street_name, Types::Coercible::String.optional.default(nil)
        attribute :number, Types::Coercible::String.optional.default(nil)
        attribute :complement, Types::Coercible::String.optional.default(nil)
        attribute :neighborhood, Types::Coercible::String.optional.default(nil)
        attribute :zip_code, Types::OnlyNumbersString.optional.default(nil)
        attribute :city, Types::Coercible::String.optional.default(nil)
        attribute :state, Types::Coercible::String.optional.default(nil)
      end
    end
  end
end
