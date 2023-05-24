# frozen_string_literal: true

# Request to create a trust application
# @see https://docs.unit.co/applications#create-trust-application
module Unit
  module Application
    class CreateTrustApplicationRequest
      attr_reader :name, :state_of_incorporation, :revocability, :source_of_funds, :tax_id,
                  :grantor, :trustees, :beneficiaries, :contact, :ip, :tags, :idempotency_key, :device_fingerprints

      # @param name [String]
      # @param state_of_incorporation [String]
      # @param revocability [String]
      # @param source_of_funds [String]
      # @param tax_id [String]
      # @param grantor [Grantor]
      # @param trustees [Array<Trustee>]
      # @param beneficiaries [Array<Beneficiary>]
      # @param contact [TrustContact]
      # @param ip [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      # @param device_fingerprints [Array<DeviceFingerprint>] - optional
      def initialize(name, state_of_incorporation, revocability, source_of_funds, tax_id,
                     grantor, trustees, beneficiaries, contact, ip = nil, tags = nil, idempotency_key = nil, device_fingerprints = nil)
        @name = name
        @state_of_incorporation = state_of_incorporation
        @revocability = revocability
        @source_of_funds = source_of_funds
        @tax_id = tax_id
        @grantor = grantor
        @trustees = trustees
        @beneficiaries = beneficiaries
        @contact = contact
        @ip = ip
        @tags = tags
        @idempotency_key = idempotency_key
        @device_fingerprints = device_fingerprints
      end

      def to_json_api
        payload = {
          data: {
            type: "trustApplication",
            attributes: {
              name: name,
              stateOfIncorporation: state_of_incorporation,
              revocability: revocability,
              sourceOfFunds: source_of_funds,
              taxId: tax_id,
              grantor: grantor&.represent,
              trustees: trustees,
              beneficiaries: beneficiaries,
              contact: contact&.represent,
              ip: ip,
              tags: tags,
              idempotencyKey: idempotency_key,
              deviceFingerprints: device_fingerprints
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
