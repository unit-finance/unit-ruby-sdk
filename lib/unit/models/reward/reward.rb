# frozen_string_literal: true

module Unit
  module Reward
    REWARD_LIMIT = 100
    REWARD_OFFSET = 0
    autoload :GetRequest, "unit/models/reward/get_request"
    autoload :CreateRewardRequest, "unit/models/reward/create_reward_request"
    autoload :ListRewardParams, "unit/models/reward/list_reward_params"
    class << self
      # Get a reward by id
      # @see https://docs.unit.co/rewards/#get-specific-reward
      # @param reward_id [String]
      # @param include [Array<String>] - optional
      def get_reward(reward_id:, include: nil)
        request = GetRequest.new(reward_id, include)
        Resource::RewardResource.get_reward(request)
      end

      # Create a reward request
      # @see https://docs.unit.co/rewards/#create-reward
      # @param receiving_account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param tags [Hash]
      # @param idempotency_key [String]
      # @param funding_account_id [String] - optional
      # @param rewarded_transaction_id [String] - optional
      def create_reward(receiving_account_id:, amount:, description:, tags:, idempotency_key:, funding_account_id: nil, rewarded_transaction: nil)
        request = CreateRewardRequest.new(receiving_account_id, amount, description, tags, idempotency_key, funding_account_id, rewarded_transaction)
        Resource::RewardResource.create_reward(request)
      end

      # List reward params request
      # @see https://docs.unit.co/rewards/#list-rewards
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param transaction_id [String] - optional
      # @param rewarded_transaction_id [String] - optional
      # @param receiving_account_id [String] - optional
      # @param customer_id [String] - optional
      # @param card_id [String] - optional
      # @param status [Array<String>] - optional
      # @param since [String] - optional
      # @param until_ [String] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def list_rewards(limit: REWARD_LIMIT, offset: REWARD_OFFSET, transaction_id: nil, rewarded_transaction_id: nil, receiving_account_id: nil, customer_id: nil, card_id: nil, status: nil, since: nil, until_: nil, tags: nil, sort: nil, include: nil)
        request = ListRewardParams.new(limit, offset, transaction_id, rewarded_transaction_id, receiving_account_id, customer_id, card_id, status, since, until_, tags, sort, include)
        Resource::RewardResource.list_rewards(request)
      end
    end
  end
end
