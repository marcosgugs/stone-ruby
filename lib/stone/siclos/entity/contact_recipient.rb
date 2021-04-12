# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      class ContactRecipient < Base
        attribute :phone_number, Types::OnlyNumbersString.optional.default(nil)
      end
    end
  end
end
