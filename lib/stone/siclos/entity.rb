# frozen_string_literal: true

module Stone
  module Siclos
    module Entity
      autoload :Address, 'stone/siclos/entity/address'
      autoload :Anticipation, 'stone/siclos/entity/anticipation'
      autoload :Bank, 'stone/siclos/entity/bank'
      autoload :CaptureMethod, 'stone/siclos/entity/capture_method'
      autoload :CardRate, 'stone/siclos/entity/card_rate'
      autoload :Contact, 'stone/siclos/entity/contact'
      autoload :CreateEstablishment, 'stone/siclos/entity/create_establishment'
      autoload :CreateEstablishmentExisting, 'stone/siclos/entity/create_establishment_existing'
      autoload :Responsible, 'stone/siclos/entity/responsible'
      autoload :ResponsibleRecipient, 'stone/siclos/entity/responsible_recipient'
      autoload :ContactRecipient, 'stone/siclos/entity/contact_recipient'
      autoload :CreateRecipient, 'stone/siclos/entity/create_recipient'
      autoload :CreateRecipientExisting, 'stone/siclos/entity/create_recipient_existing'

      class Base < Dry::Struct
        transform_keys(&:to_sym)
      end
    end
  end
end
