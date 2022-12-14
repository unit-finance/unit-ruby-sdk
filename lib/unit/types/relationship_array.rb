# frozen_string_literal: true

# represents relationship Array in the JSON API payload
module Unit
  module Types
    class RelationshipArray
      attr_reader :data

      # @param array [Array]
      def initialize(array)
        relationships = []
        array.map do |item|
          relationships << if item.is_a?(Relationship)
                             item
                           else
                             Relationship.new(item[:type], item[:id]).represent(false) end
        end
        @data = relationships
      end

      def represent
        { "data": data }
      end

      def self.from_ids_array(type, ids)
        relationships = []
        ids.map do |id|
          relationships << Relationship.new(type, id).represent(false)
        end
        RelationshipArray.new(relationships).represent
      end
    end
  end
end
