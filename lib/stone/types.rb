# frozen_string_literal: true

module Stone
  module Types
    include Dry.Types(default: :nominal)

    AmountFormatted = Integer.constructor(lambda do |value|
      ActiveSupport::NumberHelper.number_to_currency(value, unit: '', separator: '', delimiter: '').to_i
    end)

    OnlyNumbersString = String.constructor(lambda do |value|
      String(value).gsub(/[^\d]/, '').to_s
    end)
  end
end
