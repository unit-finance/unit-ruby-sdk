# frozen_string_literal: true

# Request to update a trust application
# @see https://docs.unit.co/applications/#update-trust-application
module Unit
  module Application
    class PatchTrustApplicationRequest
      attr_reader :application_id, :tags

      # @param application_id [String]
      # @param tags [Hash] - optional
      def initialize(application_id, tags = nil)
        @application_id = application_id
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "trustApplication",
            attributes: {
              tags: tags
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
