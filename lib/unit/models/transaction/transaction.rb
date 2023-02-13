# frozen_string_literal: true

module Unit
  module Transaction
    TRANSACTION_LIST_LIMIT = 100
    TRANSACTION_LIST_OFFSET = 0
    autoload :GetTransactionParams, "unit/models/transaction/get_transaction_params"
    autoload :ListTransactionParams, "unit/models/transaction/list_transaction_params"
    autoload :PatchTagsRequest, "unit/models/transaction/patch_tags_request"
    autoload :PatchBookTransactionRequest, "unit/models/transaction/patch_book_transaction_request"
    autoload :PatchChargebackTransactionRequest, "unit/models/transaction/patch_chargeback_transaction_request"

    class << self
      # Get a transaction by id
      # @see https://docs.unit.co/transactions#get-specific-transaction
      # @param transaction_id [String]
      # @param account_id [String]
      # @param customer_id [String] - optional
      # @param include [Array<String>] - optional
      def get_transaction(transaction_id:, account_id:, customer_id: nil, include: nil)
        params = GetTransactionParams.new(transaction_id, account_id, customer_id, include)
        Unit::Resource::TransactionResource.get_transaction(params)
      end

      # List transactions
      # @see https://docs.unit.co/transactions#list-transactions
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param query [String] - optional
      # @param tags [String] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      # @param card_id [String] - optional
      # @param type [Array<String>] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer] - optional
      # @param direction [String] - optional
      # @param exclude_fees [Boolean] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def list_transactions(limit: nil, offset: nil, account_id: nil, customer_id: nil,
                            query: nil, tags: nil, since: nil, _until: nil, card_id: nil, type: nil, from_amount: nil, to_amount: nil,
                            direction: nil, exclude_fees: nil, sort: nil, include: nil)
        params = ListTransactionParams.new(limit, offset, account_id, customer_id, query, tags, since,
                                           _until, card_id, type, from_amount, to_amount,
                                           direction, exclude_fees, sort, include)
        Unit::Resource::TransactionResource.list_transactions(params)
      end

      # Update transaction tags
      # @see https://docs.unit.co/transactions#update-transaction-tags
      # @param account_id [String]
      # @param transaction_id [String]
      # @param tags [Hash]
      def update_transaction(account_id:, transaction_id:, tags: nil)
        request = PatchTagsRequest.new(account_id, transaction_id, tags)
        Unit::Resource::TransactionResource.update_tags(request)
      end

      # Update a book transaction
      # @see https://docs.unit.co/transactions#update-book-transaction
      # @param account_id [String]
      # @param transaction_id [String]
      # @param summary [String]
      # @param tags [Hash] - optional
      def update_book_transaction(account_id:, transaction_id:, summary:, tags: nil)
        request = PatchBookTransactionRequest.new(account_id, transaction_id, summary, tags)
        Unit::Resource::TransactionResource.update_transaction(request)
      end

      # Update a chargeback transaction
      # @see https://docs.unit.co/transactions#update-chargeback-transaction
      # @param account_id [String]
      # @param transaction_id [String]
      # @param summary [String]
      # @param tags [Hash] - optional
      def update_chargeback_transaction(account_id:, transaction_id:, summary:, tags: nil)
        request = PatchChargebackTransactionRequest.new(account_id, transaction_id, summary, tags)
        Unit::Resource::TransactionResource.update_transaction(request)
      end
    end
  end
end
