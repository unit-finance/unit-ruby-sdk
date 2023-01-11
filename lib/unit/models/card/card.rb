# frozen_string_literal: true

module Unit
  module Card
    CARD_LIST_LIMIT = 100
    CARD_LIST_OFFSET = 0
    autoload :CreateIndividualDebitCardRequest, "unit/models/card/create_individual_debit_card_request"
    autoload :CreateBusinessDebitCardRequest, "unit/models/card/create_business_debit_card_request"
    autoload :CreateBusinessVirtualDebitCardRequest, "unit/models/card/create_business_virtual_debit_card_request"
    autoload :CreateIndividualVirtualCardRequest, "unit/models/card/create_individual_virtual_card_request"
    autoload :ReplaceCardRequest, "unit/models/card/replace_card_request"
    autoload :ListCardParams, "unit/models/card/list_card_params"

    class << self
      # Create a new individual debit card by calling Unit's API
      # @see https://docs.unit.co/cards#create-individual-debit-card
      # @param account_id [String]
      # @param shipping_address [Address] - optional
      # @param design [String] - optional
      # @param additional_embossed_text [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      # @param print_only_business_name [String] - optional
      def create_individual_debit_card(account_id:, customer_id: nil, shipping_address: nil, design: nil, additional_embossed_text: nil,
                                       idempotency_key: nil, tags: nil, limits: nil, print_only_business_name: nil)
        request = CreateIndividualDebitCardRequest.new(account_id, customer_id, shipping_address, design, additional_embossed_text,
                                                       idempotency_key, tags, limits, print_only_business_name)
        Unit::Resource::CardResource.create_card(request)
      end

      # Create a new business debit card by calling Unit's API
      # @see https://docs.unit.co/cards#create-business-debit-card
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param shipping_address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param design [String] - optional
      # @param additional_embossed_text [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      # @param print_only_business_name [Boolean] - optional
      def create_business_debit_card(account_id:, full_name:, date_of_birth:, address:, phone:, email:, shipping_address: nil,
                                     design: nil, additional_embossed_text: nil, idempotency_key: nil, tags: nil, limits: nil, print_only_business_name: nil)
        request = CreateBusinessDebitCardRequest.new(account_id, full_name, date_of_birth, address, shipping_address, phone, email, design, additional_embossed_text,
                                                     idempotency_key, tags, limits, print_only_business_name)
        Unit::Resource::CardResource.create_card(request)
      end

      # Create a new individual virtual card by calling Unit's API
      # @see https://docs.unit.co/cards#create-individual-virtual-debit-card
      # @param account_id [String]
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def create_individual_virtual_card(account_id:, customer_id: nil, idempotency_key: nil, tags: nil, limits: nil)
        request = CreateIndividualVirtualCardRequest.new(account_id, customer_id, idempotency_key, tags, limits)
        Unit::Resource::CardResource.create_card(request)
      end

      # Create a new business virtual card by calling Unit's API
      # @see https://docs.unit.co/cards#create-business-virtual-debit-card
      # @param account_id [String]
      # @param type [String]
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def create_business_virtual_card(account_id:, full_name:, date_of_birth:, address:, phone: nil, email: nil, idempotency_key: nil, tags: nil, limits: nil)
        request = CreateBusinessVirtualDebitCardRequest.new(account_id, full_name, date_of_birth, address, phone, email, idempotency_key, tags, limits)
        Unit::Resource::CardResource.create_card(request)
      end

      # Get pin status by calling Unit's API
      # @see https://docs.unit.co/cards#get-pin-status
      # @param card_id [String]
      def get_pin_status(card_id:)
        Unit::Resource::CardResource.get_pin_status(card_id)
      end

      # Report a card as a stolen by calling Unit's API
      # @param card_id [String]
      def report_stolen(card_id:)
        Unit::Resource::CardResource.report_stolen(card_id)
      end

      # Report a card as a lost by calling Unit's API
      # @param card_id [String]
      def report_lost(card_id:)
        Unit::Resource::CardResource.report_lost(card_id)
      end

      # Close a card by calling Unit's API
      # @param card_id [String]
      def close_card(card_id:)
        Unit::Resource::CardResource.close_card(card_id)
      end

      # Freeze a card by calling Unit's API
      # @param card_id [String]
      def freeze_card(card_id:)
        Unit::Resource::CardResource.freeze_card(card_id)
      end

      # Unfreeze a card by calling Unit's API
      # @param card_id [String]
      def unfreeze_card(card_id:)
        Unit::Resource::CardResource.unfreeze_card(card_id)
      end

      # Replace a card by calling Unit's API
      # @param card_id [String]
      # @param shipping_address [Address] - optional
      def replace_card(card_id:, shipping_address: nil)
        request = ReplaceCardRequest.new(card_id, shipping_address)
        Unit::Resource::CardResource.replace_card(request)
      end

      # Get a card by id by calling Unit's API
      # @param card_id [String]
      def get_card(card_id:)
        Unit::Resource::CardResource.get_card(card_id)
      end

      # List cards by calling Unit's API
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tags [Hash] - optional
      # @param status [Array<String>] - optional
      # @param include [Array] - optional
      # @param sort [String] - optional
      def list_cards(limit: CARD_LIST_LIMIT, offset: CARD_LIST_OFFSET, account_id: nil,
                     customer_id: nil, tags: nil, status: nil, include: nil, sort: nil)
        request = ListCardParams.new(limit, offset, account_id, customer_id, tags, status, include, sort)
        Unit::Resource::CardResource.list_cards(request)
      end
    end
  end
end
