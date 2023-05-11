# frozen_string_literal: true

# class to create a batch release using
module Unit
  module Payment
    class BatchReleaseRequestBuilder
      def initialize
        @requests = []
      end

      def add_request(account_id, batch_account_id, amount, description, sender_name, sender_address, sender_account_number, tags = nil, idempotency_key = nil)
        request = Unit::Payment::CreateBatchReleaseRequest.new(account_id, batch_account_id, amount, description, sender_name, sender_address, sender_account_number, tags, idempotency_key)
        @requests << request.to_hash
      end

      def to_hash
        { "data": @requests }
      end
    end
  end
end
