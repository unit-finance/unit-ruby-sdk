# frozen_string_literal: true

# represents relationships in the JSON API payload
module Unit
  module Types
    class Relationship
      attr_accessor :id, :type

      # @param id [String] The id of the relationship
      # @param type [String] The type
      def initialize(id, type)
        @id = id
        @type = type
      end

      # @param nested [Boolean] Whether or not the relationship is nested
      def represent(nested: true)
        nested ? { "data": { "id": id, "type": type } } : { "id": id, "type": type }
      end
    end
  end
end
