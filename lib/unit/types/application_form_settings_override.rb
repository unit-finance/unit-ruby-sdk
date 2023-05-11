# frozen_string_literal: true

# Type representing application form settings override
# @see https://docs.unit.co/types#applicationformsettingsoverride
module Unit
  module Types
    class ApplicationFormSettingsOverride
      attr_reader :redirect_url, :privacy_policy_url, :electronic_disclosures_url, :deposit_terms_url,
                  :client_terms_url, :cardholder_terms_url, :cash_advanced_terms_url, :debit_card_disclosure_url,
                  :additional_disclosures

      # @param redirect_url [String] - optional
      # @param privacy_policy_url [String] - optional
      # @param electronic_disclosures_url [String] - optional
      # @param deposit_terms_url [String] - optional
      # @param client_terms_url [String] - optional
      # @param cardholder_terms_url [String] - optional
      # @param cash_advanced_terms_url [String] - optional
      # @param debit_card_disclosure_url [String] - optional
      # @param additional_disclosures [Array] - optional
      def initialize(redirect_url = nil, privacy_policy_url = nil, electronic_disclosures_url = nil, deposit_terms_url = nil,
                     client_terms_url = nil, cardholder_terms_url = nil, cash_advanced_terms_url = nil, debit_card_disclosure_url = nil,
                     additional_disclosures = nil)
        @redirect_url = redirect_url
        @privacy_policy_url = privacy_policy_url
        @electronic_disclosures_url = electronic_disclosures_url
        @deposit_terms_url = deposit_terms_url
        @client_terms_url = client_terms_url
        @cardholder_terms_url = cardholder_terms_url
        @cash_advanced_terms_url = cash_advanced_terms_url
        @debit_card_disclosure_url = debit_card_disclosure_url
        @additional_disclosures = additional_disclosures
      end

      def represent
        payload = {
          redirectUrl: redirect_url,
          privacyPolicyUrl: privacy_policy_url,
          electronicDisclosuresUrl: electronic_disclosures_url,
          depositTermsUrl: deposit_terms_url,
          clientTermsUrl: client_terms_url,
          cardholderTermsUrl: cardholder_terms_url,
          cashAdvancedTermsUrl: cash_advanced_terms_url,
          debitCardDisclosureUrl: debit_card_disclosure_url,
          additionalDisclosures: additional_disclosures&.join(",")
        }
        payload.compact
      end
    end
  end
end
