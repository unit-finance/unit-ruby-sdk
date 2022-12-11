# frozen_string_literal: true

# Request to update application
# See for updating business application: https://docs.unit.co/applications/#update-business-application
# See for updating individual application: https://docs.unit.co/applications/#update-individual-application
module Unit
  module Application
    class PatchApplicationRequest
      attr_reader :application_id, :type, :tags

      # @param application_id [String] The application id
      # @param type [String] The type
      # @param optional tags [String] The tags
      def initialize(application_id, type, tags = nil)
        @application_id = application_id
        @type = type
        @tags = tags
      end

      # @return [String] The JSON API payload
      def to_json_api
        payload = {
          data: {
            type: type,
            attributes: { tags: tags }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
