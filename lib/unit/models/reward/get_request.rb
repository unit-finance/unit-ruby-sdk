# frozen_string_literal: true

# Get a reward by id request
# @see https://docs.unit.co/rewards/#get-specific-reward
module Unit
  module Reward
    class GetRequest
      attr_reader :reward_id, :include

      # @param reward_id [String]
      # @param include [Array<String>] - optional
      def initialize(reward_id, include = nil)
        @reward_id = reward_id
        @include = include
      end

      def to_hash
        { include: include&.join(",") }.compact
      end
    end
  end
end
