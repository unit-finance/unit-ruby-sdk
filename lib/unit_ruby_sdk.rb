# frozen_string_literal: true

require_relative "unit/version"

module Unit
  autoload :Application, "unit/models/application/application"
  autoload :Customer, "unit/models/customer/customer"
  autoload :Account, "unit/models/account/account"
  autoload :ApiToken, "unit/models/api_token/api_token"
  autoload :Payment, "unit/models/payment/payment"
  autoload :ReceivedPayment, "unit/models/received_payment/received_payment"
  autoload :Transaction, "unit/models/transaction/transaction"
  autoload :Card, "unit/models/card/card"
  autoload :Statement, "unit/models/statement/statement"
  autoload :AtmLocation, "unit/models/atm_location/atm_location"
  autoload :CheckDeposit, "unit/models/check_deposit/check_deposit"
  autoload :Counterparty, "unit/models/counterparty/counterparty"

  module Resource
    autoload :ApplicationResource, "unit/api_resources/application_resource"
    autoload :CustomerResource, "unit/api_resources/customer_resource"
    autoload :AccountResource, "unit/api_resources/account_resource"
    autoload :ApiTokenResource, "unit/api_resources/api_token_resource"
    autoload :PaymentResource, "unit/api_resources/payment_resource"
    autoload :ReceivedPaymentResource, "unit/api_resources/received_payment_resource"
    autoload :TransactionResource, "unit/api_resources/transaction_resource"
    autoload :CardResource, "unit/api_resources/card_resource"
    autoload :StatementResource, "unit/api_resources/statement_resource"
    autoload :AtmLocationResource, "unit/api_resources/atm_location_resource"
    autoload :CheckDepositResource, "unit/api_resources/check_deposit_resource"
    autoload :CounterpartyResource, "unit/api_resources/counterparty_resource"
  end

  module Types
    autoload :Address, "unit/types/address"
    autoload :AuthorizedUser, "unit/types/authorized_user"
    autoload :BeneficialOwner, "unit/types/beneficial_owner"
    autoload :BusinessContact, "unit/types/business_contact"
    autoload :DeviceFingerprint, "unit/types/device_fingerprint"
    autoload :EvaluationParams, "unit/types/evaluation_params"
    autoload :FullName, "unit/types/full_name"
    autoload :Officer, "unit/types/officer"
    autoload :Phone, "unit/types/phone"
    autoload :PowerOfAttorneyAgent, "unit/types/power_of_attorney_agent"
    autoload :Relationship, "unit/types/relationship"
    autoload :RelationshipArray, "unit/types/relationship_array"
    autoload :RestrictedResource, "unit/types/restricted_resource"
    autoload :DocumentFileType, "unit/types/document_file_type"
    autoload :Coordinates, "unit/types/coordinates"
  end

  autoload :UnitErrorPayload, "unit/errors/unit_error_payload"
  autoload :UnitError, "unit/errors/unit_error"
  autoload :UnitResponse, "unit/models/unit_response"
  autoload :UnitResource, "unit/models/unit_resource"

  # Configure Unit SDK - acts both as a setter and a getter
  # If params are passed, updates config
  # @param [String] api_url
  # @param [String] token
  # @return [Hash] current (updated) config
  def self.config(api_url: nil, token: nil)
    @@config ||= {}
    @@config[:api_url] = api_url if api_url
    @@config[:token] = token if token

    @@config
  end
end
