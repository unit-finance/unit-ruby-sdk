# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"
# class for creating requests for cards to Unit API and parsing responses
# @see https://docs.unit.co/cards
module Unit
  module Resource
    class CardResource < Unit::Resource::BaseResource
      class << self
        # Create a new card by calling Unit's API
        # @param [CreateIndividualDebitCardRequest, CreateIndividualVirtualCardRequest] request
        # @return [UnitResponse, UnitError]
        def create_card(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/cards", body: payload, headers: headers)
          p response_handler(response)
        end

        # Get pin status by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def get_pin_status(card_id)
          response = HttpHelper.get("#{api_url}/cards/#{card_id}/secure-data/pin/status", headers: headers)
          response_handler(response)
        end

        # Report a card as a stolen by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def report_stolen(card_id)
          response = HttpHelper.post("#{api_url}/cards/#{card_id}/report-stolen", headers: headers)
          response_handler(response)
        end

        # Report a card as a lost by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def report_lost(card_id)
          response = HttpHelper.post("#{api_url}/cards/#{card_id}/report-lost", headers: headers)
          response_handler(response)
        end

        # Close a card by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def close_card(card_id)
          response = HttpHelper.post("#{api_url}/cards/#{card_id}/close", headers: headers)
          response_handler(response)
        end

        # Freeze a card by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def freeze_card(card_id)
          response = HttpHelper.post("#{api_url}/cards/#{card_id}/freeze", headers: headers)
          response_handler(response)
        end

        # Unfreeze a card by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def unfreeze_card(card_id)
          response = HttpHelper.post("#{api_url}/cards/#{card_id}/unfreeze", headers: headers)
          response_handler(response)
        end

        # Replace a card by calling Unit's API
        # @param request [ReplaceCardRequest]
        # @return [UnitResponse, UnitError]
        def replace_card(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/cards/#{request.card_id}/replace", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a card by id by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def get_card(card_id)
          response = HttpHelper.get("#{api_url}/cards/#{card_id}", headers: headers)
          response_handler(response)
        end

        def update(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/cards/#{request.card_id}", headers: headers, body: payload)
          response_handler(response)
        end

        # List cards by calling Unit's API
        # @param params [ListCardParams]
        # @return [UnitResponse, UnitError]
        def list_cards(params = nil)
          response = HttpHelper.get("#{api_url}/cards", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # Get card limits by calling Unit's API
        # @param card_id [String]
        # @return [UnitResponse, UnitError]
        def limits(card_id)
          response = HttpHelper.get("#{api_url}/cards/#{card_id}/limits", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
