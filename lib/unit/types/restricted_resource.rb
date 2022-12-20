# frozen_string_literal: true

require "json"
module Unit
  module Types
    class RestrictedResource
      attr_reader :ids, :type

      def initialize(ids, type)
        @ids = ids
        @type = type
      end

      def to_json_api
        result = []
        @ids.each do |id|
          result << { type: type, id: id }
        end
        result
      end
    end
  end
end
