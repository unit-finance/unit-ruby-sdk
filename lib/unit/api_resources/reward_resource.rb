# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating request for rewards to Unit API and parsing responses
# @see https://docs.unit.co/Rewards
module Unit
  module Resource
    class RewardResource < Unit::Resource::BaseResource
      class << self
        # Create a new reward by calling Unit's API
        # @param request [CreateRewardRequest]
        # @return [UnitResponse, UnitError]
        def create_reward(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/rewards", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a reward by calling Unit's API
        # @param request [GetRequest]
        # @return [UnitResponse, UnitError]
        def get_reward(request)
          payload = request.to_hash
          response = HttpHelper.get("#{api_url}/rewards/#{request.reward_id}", params: payload, headers: headers)
          response_handler(response)
        end

        # List rewards by calling Unit's API
        # @param params [ListRewardParams]
        # @return [UnitResponse, UnitError]
        def list_rewards(params = nil)
          response = HttpHelper.get("#{api_url}/rewards", params: params&.to_hash, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
