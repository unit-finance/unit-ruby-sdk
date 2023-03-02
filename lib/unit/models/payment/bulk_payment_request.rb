# frozen_string_literal: true

require "json"

# class for serializing payment requests
module Unit
  module Payment
    class BulkPaymentRequest
      def self.serialize(requests)
        payload = requests.map(&:change_attributes)
        { "data": payload }.to_json
      end
    end
  end
end
