# frozen_string_literal: true

module Unit
  module Account
    module Deposit
      ACCOUNT_LIST_LIMIT = 100
      ACCOUNT_LIST_OFFSET = 0
      BALANCE_HISTORY_LIMIT = 100
      BALANCE_HISTORY_OFFSET = 0
      autoload :CreateDepositAccountRequest, "unit/models/account/deposit/create_deposit_account_request"
      autoload :CloseDepositAccountRequest, "unit/models/account/deposit/close_deposit_account_request"
      autoload :AccountOwnersRequest, "unit/models/account/deposit/account_owners_request"
      autoload :BalanceHistoryRequest, "unit/models/account/deposit/balance_history_request"
      autoload :FreezeAccountRequest, "unit/models/account/deposit/freeze_account_request"
      autoload :ListAccountParams, "unit/models/account/deposit/list_account_params"
      autoload :PatchDepositAccountRequest, "unit/models/account/deposit/patch_deposit_account_request"

      class << self
        # Create a deposit account
        # @see https://docs.unit.co/deposit-accounts#create-deposit-account
        # @param deposit_product [String]
        # @param tags [Hash]- optional
        # @param idempotency_key [String] - optional
        # @param relationships [Relationships, RelationshipArray] - optional
        # @return [UnitResponse, UnitError]
        def create_deposit_account(deposit_product:, tags: nil, relationships: nil, idempotency_key: nil)
          request = CreateDepositAccountRequest.new(deposit_product, tags, relationships, idempotency_key)
          Unit::Resource::AccountResource.create_account(request)
        end

        # Close deposit account
        # @see https://docs.unit.co/deposit-accounts#close-account
        # @param account_id [String]
        # @param reason [String]
        # @param fraud_reason [String] - optional
        # @return [UnitResponse, UnitError]
        def close_deposit_account(account_id:, reason:)
          request = CloseDepositAccountRequest.new(account_id, reason)
          Unit::Resource::AccountResource.close_account(request)
        end

        # Reopen deposit account
        # @see https://docs.unit.co/deposit-accounts#reopen-account
        # @param account_id [String]
        # @param reason [String]
        def reopen_account(account_id:)
          Unit::Resource::AccountResource.reopen_account(account_id)
        end

        # Get a deposit account by id
        # @see https://docs.unit.co/deposit-accounts#get-specific-deposit-account
        # @param account_id [String]
        def get_deposit_account(account_id:)
          Unit::Resource::AccountResource.get_account(account_id)
        end

        # Freeze deposit account
        # @see https://docs.unit.co/deposit-accounts#freeze-account
        # @param account_id [String]
        # @param reason [String]
        # @param reason_text [String] - optional
        # @return [UnitResponse, UnitError]
        def freeze_account(account_id:, reason:, reason_text: nil)
          request = FreezeAccountRequest.new(account_id, reason, reason_text)
          Unit::Resource::AccountResource.freeze_account(request)
        end

        # Unfreeze deposit account
        # @see https://docs.unit.co/deposit-accounts#freeze-account
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def unfreeze_account(account_id:)
          Unit::Resource::AccountResource.unfreeze_account(account_id)
        end

        # Listing deposit accounts
        # @see https://docs.unit.co/deposit-accounts#list-deposit-accounts
        # @param limit [Integer] - optional
        # @param offset [Integer] - optional
        # @param customer_id [String] - optional
        # @param tags [Hash] - optional
        # @param status [String] - optional
        # @param from_balance [Integer] - optional
        # @param to_balance [Integer] - optional
        # @param include [String] - optional
        # @return [UnitResponse, UnitError]
        def list_deposit_accounts(limit: ACCOUNT_LIST_LIMIT, offset: ACCOUNT_LIST_OFFSET, customer_id: nil, tags: nil,
                                  status: nil, from_balance: nil, to_balance: nil, include: nil)
          request = ListAccountParams.new(limit, offset, customer_id, tags, status, from_balance, to_balance, include)
          Unit::Resource::AccountResource.list_accounts(request)
        end

        # Update a deposit account
        # @see https://docs.unit.co/deposit-accounts#update-accounts
        # @param account_id [String]
        # @param tags [Hash] - optional
        # @param deposit_product [String] - optional
        # @return [UnitResponse, UnitError]
        def update_deposit_account(account_id:, tags: nil, deposit_product: nil)
          request = PatchDepositAccountRequest.new(account_id, tags, deposit_product)
          Unit::Resource::AccountResource.update_account(request)
        end

        # Limit a deposit account
        # @see https://docs.unit.co/deposit-accounts#account-limits
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def limits(account_id:)
          Unit::Resource::AccountResource.limits(account_id)
        end

        # Get deposit products
        # @see https://docs.unit.co/deposit-accounts#account-deposit-products
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def get_deposit_products(account_id:)
          Unit::Resource::AccountResource.get_deposit_products(account_id)
        end

        # Get account balance history by calling Unit's API
        # @see https://docs.unit.co/deposit-accounts#get-account-balance-history
        # @param limit [Integer] - optional
        # @param offset [Integer] - optional
        # @param account_id [String] - optional
        # @param customer_id [String] - optional
        # @param since [String] - optional
        # @param _until [String] - optional
        # @return [UnitResponse, UnitError]
        def get_balance_history(limit = BALANCE_HISTORY_LIMIT, offset = BALANCE_HISTORY_OFFSET, account_id: nil, customer_id: nil,
                                since: nil, _until: nil)
          request = BalanceHistoryRequest.new(limit, offset, account_id, customer_id, since, _until)
          Unit::Resource::AccountResource.get_account_balance_history(request)
        end

        # Add account owners by calling Unit's API
        # @see https://docs.unit.co/deposit-accounts#account-add-owners
        # @param account_id [String]
        # @param customers [Array<String>]
        # @return [UnitResponse, UnitError]
        def add_owners(account_id:, customers:)
          request = AccountOwnersRequest.new(account_id, customers)
          Unit::Resource::AccountResource.add_owners(request)
        end

        # Remove account owners by calling Unit's API
        # @see https://docs.unit.co/deposit-accounts#account-remove-owners
        # @param account_id [String]
        # @param customers [Array<Customer>]
        # @return [UnitResponse, UnitError]
        def remove_owners(account_id:, customers:)
          request = AccountOwnersRequest.new(account_id, customers)
          Unit::Resource::AccountResource.remove_owners(request)
        end
      end
    end
  end
end
