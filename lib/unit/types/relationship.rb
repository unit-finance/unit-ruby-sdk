# frozen_string_literal: true

# represents relationships in the JSON API payload
module Unit
  module Types
    class Relationship
      attr_accessor :id, :type

      # @param id [String] The id of the relationship
      # @param type [String] The type
      def initialize(type, id)
        @type = type
        @id = id
      end

      def to_hash
        { "data": { "type": type, "id": id } }
      end
    end
  end
end
