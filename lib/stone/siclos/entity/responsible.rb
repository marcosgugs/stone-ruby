# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class Responsible < Base
        attribute :name, Types::Coercible::String.optional.default(nil)
        attribute :cpf, Types::Coercible::String.optional.default(nil)
      end
    end
  end
end
