# frozen_string_literal: true

module Stone::Conciliation
  class Error < StandardError
    class TokenError < Error; end
  end
end
