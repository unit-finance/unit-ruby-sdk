# frozen_string_literal: true

# represents relationship Array in the JSON API payload
module Unit
  module Types
    class RelationshipArray
      attr_reader :data

      # @param array [Array]
      def initialize(array)
        @data = array
      end

      def to_hash
        { "data": data }
      end

      def self.from_params_array(array)
        @relationships = []
        array.map do |item|
          @relationships << if item.is_a?(Relationship)
                              item.to_hash[:data]
                            else
                              Relationship.new(item[:type], item[:id]).to_hash[:data] end
        end
        RelationshipArray.new(@relationships).to_hash
      end
    end
  end
end
