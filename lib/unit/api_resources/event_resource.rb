# frozen_string_literal: true

require_relative "../api_resources/base_resource"
require_relative "../models/unit_response"
require_relative "../errors/unit_error"
require_relative "../utils/http_helper"

# class for creating requests for events to Unit API and parsing responses
# @see https://docs.unit.co/events
module Unit
  module Resource
    class EventResource < Unit::Resource::BaseResource
      class << self
        # Get an event by id by calling Unit's API
        # @param event_id [String]
        # @return [UnitResponse, UnitError]
        def get(event_id)
          response = HttpHelper.get("#{api_url}/events/#{event_id}", headers: headers)
          response_handler(response)
        end

        # List events by calling Unit's API
        # @param params [ListEventParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/events", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # Fire an event by calling Unit's API
        # @param event_id [String]
        # @return [UnitResponse, UnitError]
        def fire(event_id)
          response = HttpHelper.post("#{api_url}/events/#{event_id}", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
